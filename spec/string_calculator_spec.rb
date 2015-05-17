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

    context 'when argument argument is multiple numbers' do
      let(:input) { '1,2,3,4,5' }

      it 'adds the input numbers' do
        expect(result).to eq(15)
      end
    end

    context 'when argument contains newlines instead of commas' do
      let(:input) { %W[1 2 3 4 5].join("\n") }

      it 'adds the input numbers' do
        expect(result).to eq(15)
      end
    end

    context 'when argument contains newlines and commas both' do
      let(:input) { "1\n2,3" }

      it 'adds the input numbers' do
        expect(result).to eq(6)
      end
    end

    context 'when a separator is specified' do
      let(:input) { "//;\n1;2;3" }

      it 'adds the input numbers' do
        expect(result).to eq(6)
      end
    end

    context 'when input contains numbers greater than 1000' do
      let(:input) { "2, 1000, 1001" }

      it 'ignores the numbers greater than 1000 and returns the sum of the rest' do
        expect(result).to eq(1002)
      end
    end

    context 'when the delimeter is of more than a single character' do
      let(:input) { "//[***]\n1***2***3" }

      it 'adds the input numbers' do
        expect(result).to eq(6)
      end
    end
  end
end
