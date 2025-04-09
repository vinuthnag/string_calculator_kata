class StringCalculator

  def add(numbers)
    return 0 if numbers.strip.empty?

    delimiter_regex = /,|\n/

    if numbers.start_with?("//")
      delim_line, numbers = numbers.split("\n", 2)

      if delim_line.match(/\[.*?\]/)
        delimiters = delim_line.scan(/\[(.+?)\]/).flatten
        delimiter_regex = Regexp.union(delimiters)
      else
        delimiter = delim_line[2]
        delimiter_regex = Regexp.escape(delimiter)
      end
    end

    nums = numbers.split(delimiter_regex).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?

    nums.reject { |n| n > 1000 }.sum
  end
end
