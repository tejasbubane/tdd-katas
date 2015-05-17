class StringCalculator
  def add(input)
    numbers = input.split(',').map(&:to_i)
    numbers.inject(0, :+)
  end
end
