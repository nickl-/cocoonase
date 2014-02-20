class <%= controller_class_name %>Controller < InheritedResources::Base
  has_scope <%= by_attributes %>

<% if options[:singleton] -%>
  defaults singleton: true
<% end -%>

  def can? action, type
    true
  end

  protected
  def collection
    @<%= plural_name %> ||= end_of_association_chain.page(params[:page]).per(15)
  end

  def build_resource_params
    return [] unless params[key = :<%= singular_name %>].present? || params[key = :<%= singular_table_name %>].present?
    [params.require(key).permit(
      [:_destroy, :id<%= permissible_attributes.blank? ? '' : ", #{permissible_attributes}" %><%= strong_parameters %>]
    )]
  end

  def optional_params
    []
  end
  helper_method :optional_params
end
