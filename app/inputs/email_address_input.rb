class EmailAddressInput < IconInput
  def input
    input_html_options[:type] = 'email'
    input_html_options[:icon] = 'fa fa-envelope-o'
    input_html_options[:icon_title] = 'E-mail address'
    super
  end

end
