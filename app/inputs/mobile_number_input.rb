require File.expand_path('../phone_number_input', __FILE__)

class MobileNumberInput < PhoneNumberInput
  def input
    input_html_options[:icon] = '<i class="fa fa-mobile"></i>'
    input_html_options[:icon_title] = 'Cel phone number'
    super
  end
end
