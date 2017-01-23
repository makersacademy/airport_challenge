require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  describe '#stormy?' do
    it {is_expected.to respond_to(:stormy?)}

      context 'when stormy' do
        it 'tests stormy to be true' do
          allow(weather).to receive(:stormy?).and_return(true)
          expect(weather.stormy?).to be_truthy
        end
        it 'tests stormy to be true with kernel' do
          allow(Kernel).to receive(:rand).and_return(6)
          expect(weather.stormy?).to be_truthy
        end
      end

      context 'when not stormy' do
        it 'tests stormy to be false' do
          allow(weather).to receive(:stormy?).and_return(false)
          expect(weather.stormy?).to be_falsey
        end
        it 'tests stormy to be false with kernel' do
          allow(Kernel).to receive(:rand).and_return(1)
          expect(weather.stormy?).to be_falsey
        end
      end
  end
end
