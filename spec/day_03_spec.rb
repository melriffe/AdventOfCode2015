# frozen_string_literal: true

require './lib/day_03'

RSpec.describe 'Day 3: Perfectly Spherical Houses in a Vacuum' do
  let(:fixture) { File.join fixtures_path, 'day_03.data' }
  let(:fixture_data) { File.read fixture }

  context 'Examples' do
    describe '#houses_visited' do
      it 'returns 2 for ">"' do
        model = Day03.calculate '>'
        expect(model.houses_visited).to eq 2
      end

      it 'returns 4 for "^>v<"' do
        model = Day03.calculate '^>v<'
        expect(model.houses_visited).to eq 4
      end

      it 'returns 2 for "^v^v^v^v^v"' do
        model = Day03.calculate '^v^v^v^v^v'
        expect(model.houses_visited).to eq 2
      end
    end
  end

  context 'Exercises' do
    let(:model) { Day03.calculate fixture_data }

    it 'finds houses visited' do
      expect(model.houses_visited).to eq 2592
    end
  end
end
