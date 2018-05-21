require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'is not stormy' do
      allow(weather).to receive(:stormy?).and_return false
      expect(weather.stormy?).to be false
    end
    it 'is stormy' do
      allow(weather).to receive(:stormy?).and_return true
      expect(weather.stormy?).to be true
    end
  end

end
