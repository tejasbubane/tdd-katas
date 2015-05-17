require 'spec_helper'
require_relative '../lib/string_calculator'

describe StringCalculator, "The string calculator class" do
  describe "#add" do
    let(:calc) { StringCalculator.new }
    # let expression is equal to this code
    # def calc
    #   @calc ||= StringCalculator.new
    # end
    #
    # memoizes the value for each `it`

    subject(:result) { calc.add(input) }

    context 'when argument is empty string' do # context is a test case
      let(:input) { '' }

      it 'returns 0' do
        expect(result).to eq(0)
      end
    end

    context 'when argument is single number' do
      let(:input) { '3' }

      it 'returns the number itself' do
        expect(result).to eq(3)
      end
    end

    context 'when argument is 2 numbers' do
      let(:input) { '3,4' }

      it 'adds the input numbers' do
        expect(result).to eq(7)
      end
    end
  end
end
