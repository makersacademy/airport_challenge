require 'weather'

describe Weather do
  let(:weather) { Weather.new }
  describe '#stormy?' do
    it 'it is not stormy now' do
      allow(weather).to receive(:rand).and_return 2
      expect(weather.stormy?).to eq false
    end
    it 'it is stormy now' do
      allow(weather).to receive(:rand).and_return 10
      expect(weather.stormy?).to eq true
    end
  end
end