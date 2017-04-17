require 'weather.rb'

describe Weather do
  subject(:weather) { described_class.new }
  describe '#stormy?' do
    it 'weather can be stormy' do
      allow(Kernel).to receive(:rand) { 13 }
      expect(weather.stormy?).to be true
    end

    it 'weather can not be stormy' do
      allow(Kernel).to receive(:rand) { 1 }
      expect(weather.stormy?).to be false
    end
  end
end
