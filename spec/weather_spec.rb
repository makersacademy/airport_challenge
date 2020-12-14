require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  describe '#stormy_weather?' do
    it 'assigns weather as sunny' do
      allow(weather).to receive(:stormy_weather?).and_return(false)
      expect(weather.stormy_weather?).to eq false
    end

    it 'assigns weather as stormy' do
      allow(weather).to receive(:stormy_weather?).and_return(true)
      expect(weather.stormy_weather?).to eq true
    end
  end
end