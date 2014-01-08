require 'rails/generators'
require 'rails/generators/generated_attribute'

module Rails
  module Generators
    class GeneratedAttribute
      alias _initialize initialize
      def initialize(name, type=nil, index_type=false, attr_options={})
        index_type = type.to_s if type == :has_and_belongs_to_many
        _initialize(name, type, index_type, attr_options)
        relationship index_type
      end

      def relationship rel=nil
        @relationship = rel.to_sym if %w(has_many has_one has_and_belongs_to_many).include?(rel)
        @relationship ||= default_relationship
      end

      def default_relationship
        :has_many if reference?
      end

      def references?
        %w(references).include?(type)
      end

      def belongs_to?
        type =~ /belongs_to/
      end

      def titleize
        name.titleize
      end

      def title_single
        singular_name.titleize
      end

      def title_plural
        plural_name.titleize
      end

      def singular_name
        return name unless has_many?
        name.singleize
      end

      def plural_name
        name.pluralize
      end

      def has_many?
        relationship == :has_many
      end

      def has_and_belongs_to_many?
        relationship == :has_and_belongs_to_many ||
            type == :has_and_belongs_to_many
      end

      def has_one?
        relationship == :has_one
      end
    end
  end
end

class SchemaAttributes < Hash
  class_attribute :model, :path

  def path
    @@path
  end

  class << self

    def path
      return '' if @@path.nil?
      @@path
    end

    def parse(pmodel)
      model = real_model(pmodel)
      (@@cached_atts ||= {})[model] ||= begin
        table_data = _filter_lines(
          _read_files(model,
          _model_schema_paths(model))).map {|att|
            str = to_script(*att)
            [att[1].singularize, Rails::Generators::GeneratedAttribute.parse(str)] unless str.nil? || att[1].nil?
        }
        (schema_attributes = SchemaAttributes[table_data.reject(&:blank?)]).model= model
        schema_attributes
      end
    end

    def real_model(pmodel)
      model = ns_model = pmodel.to_s.singularize
      model = model.split('/').pop if model =~ /\//
      @@path ||= ns_model.chomp(model)
      model
    end

    def populate(name, attributes)
      sa = SchemaAttributes.new
      sa.model= real_model name
      (@@cached_atts ||= {})[name] = sa.merge! attributes
    end

    private

    def table_name name
      return "#{path.gsub(/\//,'_')}#{name.pluralize}" if
          (!defined?(ActiveRecord::Base) || ActiveRecord::Base.pluralize_table_names)
      "#{path.gsub(/\//,'_')}#{name}"
    end

    def to_script(*args)
      type, name, assoc = args
      %w(has_one has_many).include? type and
          assoc = type and
          type = 'references'
      %w(has_and_belongs_to_many).include? type and
          assoc = type

      "#{name}:#{type}" + (assoc.blank? ? '' : ":#{assoc}")
    end

    def _model_schema_paths(model)
      Dir.glob("db/migrate/*#{table_name model}.rb") + ['db/schema.rb', "app/models/#{path}#{model}.rb"]
    end

    def _read_files(model, paths)
      ((paths.map {|f|
        case f[/(model|schema|migrate)/]
          when 'model'
            File.read(f)[/(?:class #{(path+model).camelize}.*)([\s\S]*?)(?=^\s*end\s*$)/, 1]
          when 'schema'
            File.read(f)[/(?:.*table "?#{table_name model}.*)([\s\S]*?)(?=^\s*end\s*$)/, 1]
          when 'migrate'
            File.read(f)[/(?:.*table :?#{table_name model}.*)([\s\S]*?)(?=^\s*end\s*$)/, 1]
        end if File.exists? f
      }) * '').lines
    end

    def _filter_lines(lines)
      before = ''
      lines.map! {|l|
        l = "#{l.chomp}  :#{before[2]}" unless before.blank?
        before = l.match(/# (\w*):-*(\w*)-*<:(\w*)/)
        l.gsub(/^\s*$|t.timestamps|authorstamps|.* scope .*|.*paper.*|.*UploadDocument.*|t\.|accepts_.*|, dep.*|^\s*$|"|:|,|#.*/,'')
      }
      (lines*="\n").scan(/belongs_to (\w*)/).each {|w| while lines =~ /.*#{w[0]}_id/; lines[/.*#{w[0]}_id/] = ''; end }
      lines.lines.reject(&:blank?).map(&:split)
    end

  end
  def merge!(*several_variants)
    super *several_variants
    replace Hash[map { |m,t|
      t.name = t.name.singularize.pluralize if references? t.name and t.has_many?
      [m.to_s.singularize.to_sym, t]
    }]
    #rehash
    (@@cached_atts ||= {})[model] = self unless model.blank?
    self
  end

  def relationship ref
    self[ref].relationship if self[ref]
  end

  def belongs_to? ref
    !self[ref].nil? && self[ref].type =~ /belongs_to/
  end

  def has_one? ref
    !self[ref].nil? && self[ref].relationship == :has_one
  end

  def has_and_belongs_to_many? ref
    !self[ref].nil? && (
      self[ref].relationship == :has_and_belongs_to_many ||
          self[ref].type == :has_and_belongs_to_many
    )
  end

  def name_for ref
    self[ref].name unless self[ref].nil?
  end

  def references? ref
    !self[ref].nil? && self[ref].type == :references
  end

  def references
    select {|name, att| references? name}
  end

  def belongs_to
    select {|name, att| belongs_to? name}
  end

  def accessible
    reject {|name, att| name.nil? ||
      %w(created_at updated_at created_by updated_by).include?(name) ||
        belongs_to?(name) ||
        references?(name)}
  end

  def hidden
    Hash[%w(id created_at updated_at created_by updated_by).map {|name|
      [name, Rails::Generators::GeneratedAttribute.parse("#{name}:#{name == 'id' ? 'int' : 'datetime'}")]
    }]
  end

  def permissible
    names = ''
    belongs_to.values.each { |att| names << ":#{att.name}_id, " }
    accessible.values.each { |att| names << ":#{att.name}, " }
    names.chomp(', ')
  end
end
