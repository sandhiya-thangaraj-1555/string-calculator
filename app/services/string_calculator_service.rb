# app/services/string_calculator_service.rb

class StringCalculatorService
  def initialize(input_string)
    @input_string = input_string
  end

  def add_numbers_from_string
    if @input_string.nil? || @input_string.empty?
      return 0
    end

    number_array = @input_string.split(",")
    if number_array.length > 2
      raise ArgumentError, "Up to two numbers only are allowed"
    end

    sum = 0
    number_array.each do |number_str|
      if number_str.nil? || number_str.empty?
        next
      end
      number = Integer(number_str) # handles non-integer input
      sum += number
    end
    sum
  end
end
