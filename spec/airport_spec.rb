require 'airport'

describe Airport do
  let(:weather) { double(:weather, :stormy? => false) }
  subject(:airport) { described_class.new("LAX", weather) }
  let(:plane) { double :plane }

  describe '#initialize' do
    it do
      is_expected.to have_attributes( :code => :LAX,
                                      :capacity => described_class::DEFAULT_CAPACITY)
    end

    it 'raises an error if invalid code is passed' do
      expect do
        Airport.new("")
      end.to raise_exception("Please provide a three-letter code for this airport")
    end

    let(:small_airport) { described_class.new("LCY", weather, 5) }
    it 'initializes with custom capacity' do
      expect(small_airport.capacity).to eq 5
    end

    it 'initializes with no planes' do
      expect do
        airport.outbound(plane)
      end.to raise_exception("There are no planes at #{airport}")
    end
  end

  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it 'calls Weather#stormy?' do
      expect(weather).to receive(:stormy?)
      airport.stormy?
    end
  end

  describe '#inbound' do
    it { is_expected.to respond_to(:inbound).with(1).argument }

    context 'when a plane lands at the airport' do
      it 'accepts inbound planes' do
        airport.inbound plane
        expect(airport).to include plane
      end

      let(:full_airport) { described_class.new("LHW", weather, 1) }
      let(:other_plane) { double :plane }
      it 'raises an exception when full' do
        full_airport.inbound(plane)
        expect do
          full_airport.inbound(other_plane)
        end.to raise_exception("Permission to land denied, #{full_airport} is full")
        expect(subject).to_not include other_plane
      end
    end
  end

  describe '#outbound' do
    it { is_expected.to respond_to(:outbound).with(1).argument }

    context 'when a plane departs from airport' do
      let(:not_at_airport) { double :plane }
      it 'raises an error if the airport is empty' do
        expect do
          airport.outbound plane
        end.to raise_exception("There are no planes at #{airport}")
      end

      it 'raises an error if the plane is not at the airport' do
        airport.inbound(plane)
        expect do
          airport.outbound(not_at_airport)
        end.to raise_exception("Plane is not currently at #{airport}")
      end

      it 'removes the plane from the airport' do
        airport.inbound(plane)
        airport.outbound(plane)
        expect(airport).not_to include plane
      end
    end
  end

  describe '#include?' do
    it { is_expected.to respond_to(:include?) }

    it 'returns true if the plane is at the airport' do
      airport.inbound(plane)
      expect(airport).to include plane
    end

    it 'returns false if the plane is not at the airport' do
      expect(airport).not_to include plane
    end
  end

  describe '#to_s' do
    it { is_expected.to respond_to(:to_s).with(0).arguments }

    it 'it returns a string version of the airport code' do
      expect(airport.to_s).to eq "LAX"
    end
  end
end
