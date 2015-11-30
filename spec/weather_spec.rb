require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'weather can be non-stormy' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather.stormy?).to be false
    end

    it 'weather can be stormy' do
      allow(Kernel).to receive(:rand).and_return 10
      expect(weather.stormy?).to be true
    end
  end
end
