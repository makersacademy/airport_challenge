require 'weather'

describe Weather do
  let(:weather) { Weather.new }
  describe '#stormy?' do
    it 'is stormy' do
      allow(weather).to receive(:rand).and_return 1
      expect(weather.stormy?).to eq true
    end

    it 'is sunny' do
      allow(weather).to receive(:rand).and_return 10
      expect(weather.stormy?).to eq false
    end
  end
end
