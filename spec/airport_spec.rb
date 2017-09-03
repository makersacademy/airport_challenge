require 'airport'

describe Airport do
  subject(:airport) { described_class.new("LGW") }

  it { is_expected.to respond_to(:planes_on_ground) }
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:takeoff_plane).with(2).arguments }
  it { is_expected.to respond_to(:iata_code) }

  describe '#land_plane' do
    it 'instructs plane to land and registers arrival' do
      plane = Plane.new("G-ZKIH")
      airport.land_plane(plane)
      expect(airport.planes_on_ground).to eq [plane.tail_number]
    end
  end

  describe '#takeoff_plane' do
    it 'instructs plane to take off and registers departure by removing it from the list of planes on ground' do
      plane = Plane.new("G-ZKIH")
      destination = Airport.new("FLR")
      airport.takeoff_plane(plane, destination)
      expect(airport.planes_on_ground).not_to eq [plane.tail_number]
    end
  end

end
