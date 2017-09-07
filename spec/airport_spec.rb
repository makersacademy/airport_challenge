require 'airport'

describe Airport do
  subject(:airport) { described_class.new("LGW") }

  DEFAULT_CAPACITY = 40

  it { is_expected.to respond_to(:planes_on_ground) }
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:takeoff_plane).with(2).arguments }
  it { is_expected.to respond_to(:iata_code) }

  describe '#land_plane' do
    it 'instructs plane to land and registers arrival' do
      plane = Plane.new("G-ZKIH")
      allow(airport).to receive(:stormy?).and_return false
      airport.land_plane(plane)
      expect(airport.planes_on_ground).to eq [plane]
    end

    it 'raises an error if weather is stormy' do
      plane = Plane.new("G-ZKIH")
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land_plane(plane) }.to raise_error 'Operation aborted: Weather is stormy'
    end
  end

  describe '#takeoff_plane' do
    it 'instructs plane to take off and registers departure by removing it from the list of planes on ground' do
      plane = Plane.new("G-ZKIH")
      allow(airport).to receive(:stormy?).and_return false
      airport.land_plane(plane)
      destination = Airport.new("FLR")
      allow(airport).to receive(:stormy?).and_return false
      airport.takeoff_plane(plane, destination)
      expect(airport.planes_on_ground).not_to eq [plane]
    end

    it 'raises an error if weather is stormy' do
      plane = Plane.new("G-ZKIH")
      destination = Airport.new("FLR")
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.takeoff_plane(plane, destination) }.to raise_error 'Operation aborted: Weather is stormy'
    end
  end

end
