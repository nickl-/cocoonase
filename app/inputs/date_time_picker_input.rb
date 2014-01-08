class DateTimePickerInput < SimpleForm::Inputs::StringInput
  def input
    input_html_options[:class].append 'form-control' unless
        (input_html_options[:class] ||= []).include? 'form-control'
    out = <<HTML
<div class="input-group date #{picker_class}" data-date="#{input_html_options[:value]}">
  #{@builder.text_field(attribute_name, input_html_options)}
  <span class="input-group-addon" onclick="$(this).prev('input').focus();" style="cursor:pointer"><i class="#{icon_class}"></i></span>
</div>
HTML
    out.html_safe
  end

  protected
  def icon_class
    'fa fa-calendar'
  end
  def picker_class
    'datetime-picker'
  end
end
