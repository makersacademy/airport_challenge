require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  describe '#stormy?' do
    it 'shows that the weather is stormy' do
      allow(weather).to receive(:is_stormy?) {true}
      expect(weather.is_stormy?).to be(true)
    end
  end

  describe '#weather_randomiser' do
    it 'returns true if the weather is stormy' do
      allow(Kernel).to receive(:rand).and_return(0.04)
      expect(weather.weather_randomiser).to be(true)
    end

    it 'returns false if the weather is not stormy' do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(weather.weather_randomiser).to be(false)
    end
  end

end
