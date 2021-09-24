require 'weather'

describe Weather do
  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it 'should report true' do
      allow(subject).to receive(:rand) { 0 }
      expect(subject.stormy?).to eq true
    end

    it 'should report false' do
      allow(subject).to receive(:rand) { 1 }
      expect(subject.stormy?).to eq false
    end
  end
end
