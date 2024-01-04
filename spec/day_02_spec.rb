# frozen_string_literal: true

require './lib/day_02'

RSpec.describe 'Day 2: I Was Told There Would Be No Math' do
  let(:fixture) { File.join fixtures_path, 'day_02.data' }
  let(:fixture_data) { File.readlines fixture }

  context 'Examples' do
    describe '#wrapping_paper_order' do
      it 'returns 58 square feet for "2x3x4"' do
        model = Day02.calculate ['2x3x4']
        expect(model.wrapping_paper_order).to eq 58
      end

      it 'returns 43 square feet for "1x1x10"' do
        model = Day02.calculate ['1x1x10']
        expect(model.wrapping_paper_order).to eq 43
      end
    end

    describe '#ribbon_order' do
      it 'returns 34 feet for "2x3x4"' do
        model = Day02.calculate ['2x3x4']
        expect(model.ribbon_order).to eq 34
      end

      it 'returns 14 feet for "1x1x10"' do
        model = Day02.calculate ['1x1x10']
        expect(model.ribbon_order).to eq 14
      end
    end
  end

  context 'Exercises' do
    let(:model) { Day02.calculate fixture_data }

    it 'finds wrapping paper amount' do
      expect(model.wrapping_paper_order).to eq 1_588_178
    end

    it 'finds ribbon amount' do
      expect(model.ribbon_order).to eq 3_783_758
    end
  end
end
