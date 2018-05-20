require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'is not stormy' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather.stormy?).to be false
    end

    it 'is stormy' do
      allow(Kernel).to receive(:rand).and_return 6
      expect(weather.stormy?).to be true
    end
  end
end
