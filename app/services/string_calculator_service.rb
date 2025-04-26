# app/services/string_calculator_service.rb

class StringCalculatorService
  def initialize(input_string)
    @input_string = input_string
  end

  def add_numbers_from_string
    return 0 if @input_string.empty?

    number_array = @input_string.split(/,|\n/) # Split by comma or newline

    number_array.map { |num| num.to_i.zero? ? 0 : num.to_i }.sum
  end
end
