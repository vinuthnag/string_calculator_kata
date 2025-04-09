class StringCalculator

  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delim_line, numbers = numbers.split("\n", 2)
      delim = delim_line[2]
      numbers = numbers.gsub(delim, ',')
    end
  
    numbers = numbers.gsub("\n", ',')
    numbers.split(',').map(&:to_i).sum
  end

end