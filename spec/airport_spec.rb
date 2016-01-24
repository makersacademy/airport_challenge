require 'airport'

describe Airport do
  subject { described_class.new(:LAX) }

  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it 'calls Kernel#rand to determine chance of storms' do
      expect(subject).to receive(:rand).with(20)
      subject.stormy?
    end

    it 'returns true (1 in 20 chance)' do
      expect(subject).to receive(:rand).with(20) { 0 }
      expect(subject.stormy?).to be_truthy
    end

    it 'returns false (19 in 20 chances)' do
      expect(subject).to receive(:rand).with(20) { rand(1..20) }
      expect(subject.stormy?).to be_falsy
    end
  end
  it { is_expected.to respond_to(:code) }
end
