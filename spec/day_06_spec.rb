# frozen_string_literal: true

require './lib/day_06'

RSpec.describe 'Day 6: Probably a Fire Hazard' do
  let(:fixture) { File.join fixtures_path, 'day_06.data' }
  let(:fixture_data) { File.readlines fixture }

  context 'Examples' do
    describe '#lights_on' do
      it 'returns 1_000_000 for "turn on 0,0 through 999,999"', :slow do
        model = Day06.calculate ['turn on 0,0 through 999,999']
        expect(model.lights_on).to eq 1_000_000
      end

      it 'returns 1_000 for "toggle 0,0 through 999,0"' do
        model = Day06.calculate ['toggle 0,0 through 999,0']
        expect(model.lights_on).to eq 1_000
      end

      it 'returns 0 for "turn off 499,499 through 500,500"' do
        model = Day06.calculate ['turn off 499,499 through 500,500']
        expect(model.lights_on).to be_zero
      end
    end

    describe '#brightness' do
      it 'returns 1 for "turn on 0,0 through 0,0"' do
        model = Day06.calculate ['turn on 0,0 through 0,0']
        expect(model.brightness).to eq 1
      end

      it 'returns 2_000_000 for "toggle 0,0 through 999,999"', :slow do
        model = Day06.calculate ['toggle 0,0 through 999,999']
        expect(model.brightness).to eq 2_000_000
      end
    end
  end

  context 'Exercises' do
    let(:model) { Day06.calculate fixture_data }

    it 'finds number of lit lights', :slow do
      expect(model.lights_on).to eq 569_999
    end

    it 'finds total brightness', :slow do
      expect(model.brightness).to eq 17_836_115
    end
  end
end
