#require 'application_helper'
#require 'action_view/helpers/asset_tag_helper'
class ButtonFileInput < SimpleForm::Inputs::FileInput
  include ApplicationHelper
  include ActionView::Helpers::AssetTagHelper

  def input
    field_value = input_html_options[:data][:value] ?
        input_html_options[:data].delete(:value) :
        input_html_options[:value]
    Rails.logger.info "----------------------------------------------------> field_value.path"
    field_type = input_html_options[:data][:uploadtype] || (field_value.path =~ /\.png$|\.jpe?g$|\.gif$/i ? 'image' : 'file')
    field_preview = ''
    field_preview = string_view(field_value, field_value.model.class.columns_hash['payload']) if field_type == 'file'
    field_preview = link_to(image_tag("#{payload_url(field_value)}?thumb=1"), payload_url(field_value)) if field_type == 'image'

    out = <<HTML
<div class="fileinput #{ field_value.blank? ? 'fileinput-new' : 'fileinput-exists' }" data-provides="fileinput">
  <span class="btn btn-file"><span class="fileinput-new">Select #{field_type}</span>
    <span class="fileinput-exists">Change</span>#{ super }</span>
  <span class="fileinput-preview fileinput-exists#{' thumbnail" style="width: 70px; height: 100px;' if field_type == 'image'}">
    #{ field_preview }
  </span>
  <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="float: none">×</a>
</div>
HTML

    out.html_safe
  end

  def default_url_options
    {}
  end

  def controller
    :service_action
  end
end
