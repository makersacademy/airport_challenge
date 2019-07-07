require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy' do
    context 'when the weather is stormy' do
      it 'returns true' do
        allow(Kernel).to receive(:rand) { 6 }
        expect(weather.stormy?).to be true
      end
    end

    context 'when the weather is not stormy' do
      it 'returns false' do
        allow(Kernel).to receive(:rand) { 2 }
        expect(weather.stormy?).to be false
      end
    end
  end
end