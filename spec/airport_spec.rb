require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe 'land' do
    it 'allows a plane to land at an airport' do
      expect(airport.land(plane)).to eq([plane])
    end

    it 'allows multiple planes to land in an airport with a larger capacity' do
      airport = Airport.new(2)
      airport.land(plane)
      expect(airport.land(plane)).to eq([plane, plane])
    end

    it 'prevents landing when the airport is full' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error 'Airport full'
    end

    it 'prevents landing in a larger airport when the airport is full' do
      airport = Airport.new(2)
      2.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Airport full'
    end
  end

  describe 'takeoff' do
    it 'removes a plane from the airport' do
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq(plane)
      expect(airport.hangar).to eq([])
    end

    it 'removes a specific plane from the airport' do
      airport = Airport.new(2)
      airbus = Plane.new
      boeing = Plane.new
      airport.land(airbus)
      airport.land(boeing)
      expect(airport.takeoff(boeing)).to eq(boeing)
      expect(airport.hangar).to eq([airbus])
    end
  end

  describe 'hangar' do
    it 'has a variable capacity' do
      airport = Airport.new(50)
      expect(airport.capacity).to eq(50)
      airport_2 = Airport.new(20)
      expect(airport_2.capacity).to eq(20)
    end

    it 'has a default capacity if no capacity given' do
      airport = Airport.new
      expect(airport.capacity).to eq(1)
    end
  end
end
