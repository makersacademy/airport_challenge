require 'airport'

describe Airport do
  # TODO: alias subject
  subject { described_class.new("LAX") }
  let(:plane) { Plane.new }

  describe '#initialize' do
    it { is_expected.to respond_to(:code) }
    it { is_expected.to respond_to(:planes) }
    it { is_expected.to respond_to(:capacity) }

    it 'initializes with default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    let(:small_airport) { described_class.new("LCY", 5) }
    it 'initializes with custom capacity' do
      expect(small_airport.capacity).to eq 5
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

  describe '#inbound' do
    it { is_expected.to respond_to(:inbound).with(1).argument }

    context 'when airport is not full' do
      it 'accepts inbound planes' do
        subject.inbound plane
        expect(subject.planes).to include plane
      end
    end

    context 'when airport is full' do
      let(:full_airport) { described_class.new("LHW", 0) }

      it 'raises an exception and does not accept inbound planes' do
        expect{ full_airport.inbound(plane) }.to raise_exception("Permission to land denied, #{full_airport} is full")
      end
    end
  end

  describe '#outbound' do
    it { is_expected.to respond_to(:outbound).with(1).argument }
    context 'when a plane departs from airport' do

    end
  end
end
