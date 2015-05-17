require_relative 'string_calculator'
require 'minitest/autorun'

class StringCalculatorTest < MiniTest::Test
  def test_returns_zero_for_empty_string
    assert_equal 0, StringCalculator.add("")
  end

  def test_returns_sum_for_one_number
    assert_equal 2, StringCalculator.add('2')
  end

  def test_returns_sum_for_multiple_numbers
    assert_equal 9, StringCalculator.add('2,3,4')
  end
end
