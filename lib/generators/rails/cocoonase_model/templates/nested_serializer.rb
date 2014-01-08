<% module_namespacing do -%>
class <%= class_name %>Serializer < ActiveModel::Serializer
<% attributes_names.map(&:inspect).each do |att| -%>
  attribute <%= att %><%= att =~ /_/ ? "#, key: #{att.camelize(:lower)}" : '' %>
<% end -%>
end
<% end -%>

<% module_namespacing do -%>
class <%= class_name %>Serializer < <%= parent_class_name %>
  attributes <%= attributes_names.map(&:inspect).join(", ") %>
    <% association_names.each do |attribute| -%>
  has_one :<%= attribute %>
    <% end -%>
end
<% end -%>
