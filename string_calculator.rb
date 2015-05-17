module StringCalculator
  def self.add(input)
    numbers = input.split(',')

    numbers.map(&:to_i).inject(0, :+)
  end
end
