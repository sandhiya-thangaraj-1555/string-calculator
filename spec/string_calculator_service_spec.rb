# spec/services/string_calculator_service_spec.rb
require 'rails_helper' # or spec_helper, depending on your setup
RSpec.describe StringCalculatorService do

  describe '#add' do
    it 'should return 0 for an empty string' do
      calculator = StringCalculatorService.new('') # Instantiate the service
      expect(calculator.add_numbers_from_string).to eq(0)
    end

    it 'should return the number if only one number is given' do
      calculator = StringCalculatorService.new('1')
      expect(calculator.add_numbers_from_string).to eq(1)
    end

    it 'should return the addition of given numbers' do
      calculator = StringCalculatorService.new('1, 4')
      expect(calculator.add_numbers_from_string).to eq(5)
    end

    it 'should return the sum of two numbers separated by a newline' do
      calculator = StringCalculatorService.new("1\n2")
      expect(calculator.add_numbers_from_string).to eq(3)
    end

    it 'should return the sum of numbers separated by both commas and newlines' do
      calculator = StringCalculatorService.new("1\n2,3")
      expect(calculator.add_numbers_from_string).to eq(6)
    end

    it 'should handle a custom delimiter' do
      calculator = StringCalculatorService.new("//;\n1;2")
      expect(calculator.add_numbers_from_string).to eq(3)
    end

    it 'should handle a custom delimiter with newlines' do
      calculator = StringCalculatorService.new("//;\n1;2\n3")
      expect(calculator.add_numbers_from_string).to eq(6)
    end

    it 'should handle a custom delimiter and the default delimiters' do
      calculator = StringCalculatorService.new("//@\n1@2;,3\n4")
      expect(calculator.add_numbers_from_string).to eq(10)
    end
  end
end
