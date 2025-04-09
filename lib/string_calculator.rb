class StringCalculator

  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delim_line, numbers = numbers.split("\n", 2)
      delim = delim_line[2]
      numbers = numbers.gsub(delim, ',')
    end
  
    numbers = numbers.gsub("\n", ',')
    nums = numbers.split(',').map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?

    nums.reject{|n| n > 1000}.sum
  end

end