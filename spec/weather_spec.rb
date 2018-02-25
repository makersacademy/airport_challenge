require_relative '../lib/weather'

describe Weather do
  subject(:fc) { described_class.new }
  describe '#stormy?' do
    it 'returns the weather forecast to have storms' do
      allow(fc).to receive(:stormy?). and_return(true)
      expect(fc.stormy?).to eq true
    end

    it 'returns the weather forecast to be fine' do
      allow(fc).to receive(:stormy?). and_return(false)
      expect(fc.stormy?).to eq false
    end
  end
end
