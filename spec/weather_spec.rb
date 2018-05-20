require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'can be stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect(subject.stormy?).to eq true
    end
    it 'can be non-stormy' do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.stormy?).to eq false
    end
  end
end
