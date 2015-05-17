require 'spec_helper'
require_relative '../lib/string_calculator'

describe StringCalculator, "The string calculator class" do
  describe "#add" do
    it 'returns 0 for empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns the number itself for single number input' do
      expect(StringCalculator.add('3')).to eq(3)
    end

    it 'adds the input numbers for multiple inputs' do
      expect(StringCalculator.add('3,4')).to eq(7)
    end
  end
end
