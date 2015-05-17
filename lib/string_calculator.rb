class StringCalculator
  attr_reader :input

  def add(input)
    @input = input
    delimeters, string = process_for_delimeters
    numbers = [string]
    delimeters.each do |delimeter|
      numbers = split(numbers, delimeter)
    end
    numbers.map(&:to_i).reject { |n| n > 1000 }.inject(0, :+)
  end

  private

  def process_for_delimeters
    if input.start_with?("//")
      find_delimeters
    else
      default_delimeters
    end
  end

  def find_delimeters
    delimeter = if input.include?("[")
                  input.scan(/\[([^\]]*)\]\n/)
                else
                  input.scan(/^\/\/(.){1}(\n)/)
                end.flatten
    number_string = input.split("\n").last
    [delimeter, number_string]
  end

  def split(arg, delimeter)
    arg = [arg] if arg.is_a? String
    arg.map do |string|
      string.split(delimeter)
    end.flatten
  end

  def default_delimeters
    return [",", "\n"], input
  end
end
