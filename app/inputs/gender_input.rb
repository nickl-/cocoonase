require File.expand_path('../switch_input', __FILE__)

class GenderInput < SwitchInput
  def input
    (input_html_options[:data] ||=[])[:data_on] = ''
    input_html_options[:data][:data_off] = ''
    input_html_options[:data][:data_on_label] = "<i class='fa fa-male'></i>"
    input_html_options[:data][:data_on_label] = "<i class='fa fa-female'></i>"
    super
  end
end
