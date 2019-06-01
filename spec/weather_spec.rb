require 'weather'

describe Weather do
  describe '#stormy?' do
    context 'Yes' do
      before do
        allow(subject).to receive(:rand).and_return 7
      end
      it 'Is stormy' do
        expect(subject.stormy?).to eq true
      end
    end
    context 'No' do
      before do
        allow(subject).to receive(:rand).and_return 3
      end
      it 'Is not stormy' do
        expect(subject.stormy?).to eq false
      end
    end
  end
end
