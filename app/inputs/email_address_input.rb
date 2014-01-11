require File.expand_path('../icon_input', __FILE__)

class EmailAddressInput < IconInput
  def input
    input_html_options[:type] = 'email'
    input_html_options[:icon] = '<i class="fa fa-envelope-o"></i>'
    input_html_options[:icon_title] = 'E-mail address'
    super
  end
end
