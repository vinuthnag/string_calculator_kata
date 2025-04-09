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

  it 'returns sum of all the comma separated numbers' do
    expect(StringCalculator.new.add("1,2,3,4")).to eq(10)
  end

  it 'handles newline as a delimiter' do
    expect(StringCalculator.new.add("1\n2,3")).to eq(6)
  end

  it 'supports different delimeters' do
    expect(StringCalculator.new.add("//;\n1;2")).to eq(3)
  end

  it 'raises an exception for negative numbers' do
    expect { StringCalculator.new.add("1,-2,3,-4") }
      .to raise_error("negative numbers not allowed: -2,-4")
  end

  it 'ignores numbers greater than 1000' do
    expect(StringCalculator.new.add("2,1001")).to eq(2)
  end

  it 'supports delimiters of any length' do
    expect(StringCalculator.new.add("//[***]\n1***2***3")).to eq(6)
  end

end