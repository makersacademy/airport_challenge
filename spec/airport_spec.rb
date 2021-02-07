require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to be_a(Airport) }

  describe '#land' do
    it 'lands a plane at the airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq(airport.hangar)
    end

    it 'raises an error and prevents plane landing when the airport is full' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      10.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'raises an error and prevents plane landing when weather is stormy' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:rand).and_return(10)
      airport.checkweather
      expect { airport.land(plane) }.to raise_error("Plane cannot land due to stormy weather conditions")
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off and is no longer at the airport' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:rand).and_return(1)
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.hangar).to eq([])
    end

    it 'raises an error when weather is stormy so plane cannot take off' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      allow(airport).to receive(:rand).and_return(10)
      airport.checkweather
      expect { airport.take_off(plane) }.to raise_error("Plane cannot take off due to stormy weather conditions")
    end

    it 'raises an error when plan is trying to take off from an airport they are not in' do
      airport1 = Airport.new
      airport2 = Airport.new
      plane = Plane.new
      allow(airport1).to receive(:rand).and_return(1)
      airport1.land(plane)
      expect { airport2.take_off(plane) }.to raise_error("Plane cannot take off from an airport it is not in")
    end
  end

  describe '#override_capacity' do
    it 'overrides the default capacity of the airport' do
      airport = Airport.new
      airport.override_capacity(5)
      expect(airport.capacity).to eq(5)
    end
  end

  describe '#weather' do
    airport = Airport.new
    it 'retrieves weather condition of the day' do
      expect(['Stormy', 'Sunny']).to include(airport.weather)
    end
  end
end
