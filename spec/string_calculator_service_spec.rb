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
  end
end
