class StringCalculator
  def add(input)
    numbers = if match = /^\/\/(.){1}(\n)/.match(input)
                delimeter = match[1]
                number_string = input.split(match[0]).last
                number_string.split(delimeter)
              elsif match = /^\/\/\[([^\]]*)\](\n)/.match(input)
                delimeter = match[1]
                number_string = input.split(match[0]).last
                number_string.split(delimeter)
              else
                input.split(",").map do |num|
                  num.split("\n")
                end.flatten
              end
    numbers.map(&:to_i).reject { |n| n > 1000 }.inject(0, :+)
  end
end
