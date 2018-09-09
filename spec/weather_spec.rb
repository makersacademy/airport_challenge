require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  describe '#stormy?' do
    it 'returns false when sunny' do
      allow(subject).to receive(:rand) { 0 }
      expect(subject.stormy?).to eq(false)

      allow(subject).to receive(:rand) { 1 }
      expect(subject.stormy?).to eq(false)

      allow(subject).to receive(:rand) { 2 }
      expect(subject.stormy?).to eq(false)

      allow(subject).to receive(:rand) { 3 }
      expect(subject.stormy?).to eq(false)

      allow(subject).to receive(:rand) { 4 }
      expect(subject.stormy?).to eq(false)

      allow(subject).to receive(:rand) { 5 }
      expect(subject.stormy?).to eq(false)

      allow(subject).to receive(:rand) { 6 }
      expect(subject.stormy?).to eq(false)

      allow(subject).to receive(:rand) { 7 }
      expect(subject.stormy?).to eq(false)

      allow(subject).to receive(:rand) { 8 }
      expect(subject.stormy?).to eq(false)
    end

    it 'returns true when stormy' do
      allow(subject).to receive(:rand) { 9 }
      expect(subject.stormy?).to eq(true)
    end
  end
end
