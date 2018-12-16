require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy' do
    it 'allows the weather to be sunny' do
      allow(Kernel).to receive(:rand).and_return(2)
      expect(weather.stormy?).to be false
    end

    it 'allows the weather to be stormy' do
      allow(Kernel).to receive(:rand).and_return(6)
      expect(weather.stormy?).to be true
    end
  end
end
