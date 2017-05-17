require 'Weather'

describe Weather do
  describe '#stormy?' do
    it 'can be non-stormy' do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.stormy?).to be false
    end

    it 'can be stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect(subject.stormy?).to be true
    end
  end
end
