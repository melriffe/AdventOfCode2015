# frozen_string_literal: true

require './lib/day_05'

RSpec.describe "Day 5: Doesn't He Have Intern-Elves For This?" do
  let(:fixture) { File.join fixtures_path, 'day_05.data' }
  let(:fixture_data) { File.readlines fixture }

  context 'Examples' do
    describe StandardLogic do
      describe '#nice?' do
        it 'returns true for "ugknbfddgicrmopn"' do
          model = described_class.new 'ugknbfddgicrmopn'
          expect(model).to be_nice
        end

        it 'returns true for "aaa"' do
          model = described_class.new 'aaa'
          expect(model).to be_nice
        end

        it 'returns false for "jchzalrnumimnmhp"' do
          model = described_class.new 'jchzalrnumimnmhp'
          expect(model).not_to be_nice
        end

        it 'returns false for "haegwjzuvuyypxyu"' do
          model = described_class.new 'haegwjzuvuyypxyu'
          expect(model).not_to be_nice
        end

        it 'returns false for "dvszwmarrgswjxmb"' do
          model = described_class.new 'dvszwmarrgswjxmb'
          expect(model).not_to be_nice
        end
      end
    end

    describe AdvancedLogic do
      describe '#nice?' do
        it 'returns true for "qjhvhtzxzqqjkmpb"' do
          model = described_class.new 'qjhvhtzxzqqjkmpb'
          expect(model).to be_nice
        end

        it 'returns true for "xxyxx"' do
          model = described_class.new 'xxyxx'
          expect(model).to be_nice
        end

        it 'returns false for "uurcxstgmygtbstg"' do
          model = described_class.new 'uurcxstgmygtbstg'
          expect(model).not_to be_nice
        end

        it 'returns false for "ieodomkazucvgmuy"' do
          model = described_class.new 'ieodomkazucvgmuy'
          expect(model).not_to be_nice
        end
      end
    end
  end

  context 'Exercises' do
    it 'finds count of nice strings' do
      model = Day05.calculate fixture_data
      expect(model.nice_count).to eq 258
    end

    it 'finds count of nice strings using new rules' do
      model = Day05.calculate fixture_data, :advanced
      expect(model.nice_count).to eq 53
    end
  end
end
