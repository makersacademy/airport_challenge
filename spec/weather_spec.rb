require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy' do
    it 'can be stormy' do
      allow(Kernel).to receive(:rand).and_return(9)
      expect(weather.stormy?).to be true
    end

    it 'can not be stormy' do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(weather.stormy?).to be false
    end
  end
end
