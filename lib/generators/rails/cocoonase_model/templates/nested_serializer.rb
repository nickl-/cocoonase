<% module_namespacing do -%>
class <%= class_name %>Serializer < ActiveModel::Serializer
<% attributes_names.map(&:inspect).each do |att| -%>
  attribute <%= att %><%= att =~ /_/ ? "#, key: #{att.camelize(:lower)}" : '' %>
  def id
    object.read_attribute_for_serialization(:id)
  end
<% end -%>
end
<% end -%>
