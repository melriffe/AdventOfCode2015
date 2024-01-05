# frozen_string_literal: true

require './lib/day_04'

RSpec.describe 'Day 4: The Ideal Stocking Stuffer' do
  let(:fixture_data) { 'yzbqklnj' }

  context 'Examples' do
    describe '#lowest_number' do
      it 'returns 609043 for "abcdef"' do
        model = Day04.calculate 'abcdef'
        expect(model.lowest_number).to eq 609_043
      end

      it 'returns 1048970 for "pqrstuv"' do
        model = Day04.calculate 'pqrstuv'
        expect(model.lowest_number).to eq 1_048_970
      end
    end
  end

  context 'Exercises' do
    it 'finds five zeros answer' do
      model = Day04.calculate fixture_data
      expect(model.lowest_number).to eq 282_749
    end

    context 'with slow running test', :slow do
      it 'finds six zeros answer' do
        model = Day04.calculate fixture_data, /^0{6}/
        expect(model.lowest_number).to eq 282_749
      end
    end
  end
end
