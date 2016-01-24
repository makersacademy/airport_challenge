require 'airport'

describe Airport do
  subject(:airport) { described_class.new("LAX") }
  let(:plane) { double :plane }

  describe '#initialize' do
    it { is_expected.to respond_to(:code) }
    it { is_expected.to respond_to(:capacity) }

    it 'initializes with an airport code' do
      expect(airport.code).to eq :LAX
    end

    it 'initializes with default capacity' do
      expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    let(:small_airport) { described_class.new("LCY", 5) }
    it 'initializes with custom capacity' do
      expect(small_airport.capacity).to eq 5
    end

    # NOTE: how to test this without attr_reader or public method?
    # it 'initializes with no planes' do
    #   expect(airport).to be_empty
    # end
  end

  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it 'calls Kernel#rand to determine chance of storms' do
      expect(airport).to receive(:rand).with(20)
      airport.stormy?
    end

    it 'returns true (1 in 20 chance)' do
      expect(airport).to receive(:rand).with(20) { 0 }
      expect(airport.stormy?).to be_truthy
    end

    it 'returns false (19 in 20 chances)' do
      # FIXME: unsure if using rand() in test is appropriate
      expect(airport).to receive(:rand).with(20) { rand(1..20) }
      expect(airport.stormy?).to be_falsy
    end
  end

  describe '#inbound' do
    it { is_expected.to respond_to(:inbound).with(1).argument }

    context 'when airport is not full' do
      it 'accepts inbound planes' do
        airport.inbound plane
        expect(airport).to include plane
      end
    end

    context 'when airport is full' do
      let(:full_airport) { described_class.new("LHW", 0) }

      it 'raises an exception and does not accept inbound planes' do
        expect do
          full_airport.inbound(plane)
        end.to raise_exception("Permission to land denied, #{full_airport} is full")
        expect(subject).to_not include plane
      end
    end
  end

  describe '#outbound' do
    it { is_expected.to respond_to(:outbound).with(1).argument }
    context 'when a plane departs from airport' do
      #TODO
    end
  end

  describe '#to_s' do
    it { is_expected.to respond_to(:to_s).with(0).arguments }

    it 'it returns a string version of the airport code' do
      expect(airport.to_s).to eq "LAX"
    end
  end
end
