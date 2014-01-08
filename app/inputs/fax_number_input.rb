require File.expand_path('../phone_number_input', __FILE__)

class FaxNumberInput <PhoneNumberInput
  def input
    input_html_options[:icon] = 'fa fa-print'
    input_html_options[:icon_title] = 'Fax number'
    super
  end
end
