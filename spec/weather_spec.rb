require 'weather'

describe Weather do
  describe '#stormy?' do

    it 'retruns true if the weather condition is stormy' do
      weather = Weather.new(:stormy)
      expect(weather.stormy?).to eq(true)
    end

    it 'retuns false if the weather condition is normal' do
      weather = Weather.new(:normal)
      expect(weather.stormy?).to eq(false)
    end
  end
end
