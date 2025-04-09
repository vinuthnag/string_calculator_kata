require 'string_calculator'

RSpec.describe StringCalculator do

  it 'returns 0 for empty string' do
    expect(StringCalculator.new.add("")).to eq(0)
  end

  it 'returns thenumbers when it has one input' do
    expect(StringCalculator.new.add("5")).to eq(5)
  end

  it 'returns sum of the two comma separated numbers' do
    expect(StringCalculator.new.add("1,2")).to eq(3)
  end

  


end