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

    context 'with Robo-Santa' do
      describe '#houses_visted' do
        it 'returns 3 for "^v"' do
          model = Day03.robo_calculate '^v'
          expect(model.houses_visited).to eq 3
        end

        it 'returns 3 for "^>v<"' do
          model = Day03.robo_calculate '^>v<'
          expect(model.houses_visited).to eq 3
        end

        it 'returns 11 for "^v^v^v^v^v"' do
          model = Day03.robo_calculate '^v^v^v^v^v'
          expect(model.houses_visited).to eq 11
        end
      end
    end
  end

  context 'Exercises' do
    it 'finds houses visited' do
      model = Day03.calculate fixture_data
      expect(model.houses_visited).to eq 2592
    end

    context 'with Robo-Santa' do
      it 'finds houses visited' do
        model = Day03.robo_calculate fixture_data
        expect(model.houses_visited).to eq 2360
      end
    end
  end
end
