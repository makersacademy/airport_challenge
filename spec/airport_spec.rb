require './lib/airport'

describe Airport do
  let(:plane) { double :plane }

  describe '#land' do
    context 'when it is not stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end
      it { is_expected.to respond_to(:land).with(1).argument }

    end
    context 'when stormy' do
      it 'raises an error' do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.land(plane) }.to raise_error 'Stormy weather'
      end
    end
  end

  describe '#take_off' do
    context 'when it is not stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end
      it { is_expected.to respond_to(:take_off).with(1).argument }
    end

    it 'confirm plane no longer in airport' do
      expect(subject.plane).to eq nil
    end
    context 'when stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return true
      end

      it 'raises an error' do
        expect { subject.take_off(plane) }.to raise_error 'Stormy weather'
      end
    end
  end

end
