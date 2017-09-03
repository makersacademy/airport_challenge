require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  it { is_expected.to respond_to(:on_ground) }
  it { is_expected.to respond_to(:location) }

  describe '#land' do
    it 'can land at airport' do
      airport = Airport.new("LGW")
      expect(plane.land(airport))
    end

    it 'confirms when lands' do
      airport = Airport.new("LGW")
      plane.land(airport)
      expect(plane.on_ground).to be true
    end

    it 'sets location to the airport it has landed' do
      airport = Airport.new("LGW")
      plane.land(airport)
      expect(plane.location).to eq airport.iata_code
    end
  end

  describe '#takeoff' do
    it 'can takeoff from airport to destination' do
      expect(plane.takeoff(:destination))
    end

    it 'confirms departure' do
      plane.takeoff(:destination)
      expect(plane.on_ground).to be false
    end

    it 'sets location to flying after takeoff' do
      plane.takeoff(:destination)
      expect(plane.location).to eq "air"
    end
  end

end
