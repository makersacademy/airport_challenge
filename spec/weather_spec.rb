require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  context 'Random Weather tests: ' do
    it 'should be sunny more often than stormy' do
      good = 0
      bad = 0
      1_000.times do
        third_runway = weather.climate
        if third_runway == :stormy
          bad += 1
        else
          good += 1
        end
      end
      expect(good > bad).to eq true
    end
  end
end
