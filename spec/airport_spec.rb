require 'airport'

describe Airport do
  subject { described_class.new("LAX") }

  describe '#initialize' do
    it { is_expected.to respond_to(:code) }
    it { is_expected.to respond_to(:capacity) }

    it 'initializes with default capacity of 100' do
      expect(subject.capacity).to eq 100
    end

    let(:small_airport) { described_class.new("LCY", 50) }
    it 'initializes with custom capacity' do
      expect(small_airport.capacity).to eq 50
    end
  end

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
      # FIXME: unsure if using rand() in test is appropriate
      expect(subject).to receive(:rand).with(20) { rand(1..20) }
      expect(subject.stormy?).to be_falsy
    end
  end
end
