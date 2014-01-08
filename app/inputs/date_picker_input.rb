require File.expand_path('../date_time_picker_input', __FILE__)

class DatePickerInput < DateTimePickerInput
  def picker_class
    'date-picker'
  end
end
