<% module_namespacing do -%>
class <%= class_name %>Serializer < ActiveModel::Serializer
<% attributes_names.map(&:inspect).each do |att| -%>
<%   if att == 'payload' -%>
  attributes :name, :image?, :payload_url, :payload_thumb
<%   else -%>
  attributes <%= att %><%= att =~ /_/ ? "#, key: #{att.camelize(:lower)}" : '' %>
<%   end -%>
<% end -%>
end
<% end -%>
