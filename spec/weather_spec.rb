require 'weather'

describe Weather do

  describe '#stormy?' do
    context 'when not stormy' do
      it 'returns false' do
        allow(subject).to receive(:rand) { 2 }
        expect(subject.stormy?).to eq false
      end
    end
    context 'when stormy' do
      it 'returns true' do
        allow(subject).to receive(:rand) { 9 }
        expect(subject.stormy?).to eq true
      end
    end
  end
end
