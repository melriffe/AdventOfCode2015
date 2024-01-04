# frozen_string_literal: true

require './lib/day_01'

RSpec.describe 'Day 1: Not Quite Lisp' do
  let(:fixture) { File.join fixtures_path, 'day_01.data' }
  let(:fixture_data) { File.read fixture }

  context 'Examples' do
    describe '#floor' do
      it 'returns 0 for "(())"' do
        model = Day01.calculate '(())'
        expect(model.floor).to eq 0
      end

      it 'returns 0 for "()()"' do
        model = Day01.calculate '()()'
        expect(model.floor).to eq 0
      end

      it 'returns 3 for "((("' do
        model = Day01.calculate '((('
        expect(model.floor).to eq 3
      end

      it 'returns 3 for "(()(()("' do
        model = Day01.calculate '(()(()('
        expect(model.floor).to eq 3
      end

      it 'returns 3 for "))((((("' do
        model = Day01.calculate '))((((('
        expect(model.floor).to eq 3
      end

      it 'returns -1 for "())"' do
        model = Day01.calculate '())'
        expect(model.floor).to eq(-1)
      end

      it 'returns -1 for "))("' do
        model = Day01.calculate '))('
        expect(model.floor).to eq(-1)
      end

      it 'returns -3 for ")))"' do
        model = Day01.calculate ')))'
        expect(model.floor).to eq(-3)
      end

      it 'returns -3 for ")())())"' do
        model = Day01.calculate ')())())'
        expect(model.floor).to eq(-3)
      end
    end

    describe '#position' do
      it 'returns 1 for ")"' do
        model = Day01.calculate ')'
        expect(model.position).to eq 1
      end

      it 'returns 5 for "()())"' do
        model = Day01.calculate '()())'
        expect(model.position).to eq 5
      end
    end
  end

  context 'Exercises' do
    let(:model) { Day01.calculate fixture_data }

    it 'finds the right floor' do
      expect(model.floor).to eq 74
    end

    it 'finds the position upon entering basement' do
      expect(model.position).to eq 1795
    end
  end
end
