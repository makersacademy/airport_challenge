require 'weather'

describe Weather do
  let(:weather) { weather = Weather.new }

  context '#stormy?' do
    it 'calculates the weather to be not stormy' do
      allow(weather).to receive(:calculate) { 0 }
      expect(weather.stormy?).to eq false
    end

    it 'calculates the weather to be stormy' do
      allow(weather).to receive(:calculate) { 3 }
      expect(weather.stormy?).to eq true
    end
  end

  context '#calculate' do
    it 'returns a number between 0 and 3' do
      expect(weather.calculate).to be_between(0, 3)
    end
  end
end
