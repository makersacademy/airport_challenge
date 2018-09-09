require 'airport'

describe Airport do
  let(:airport) { Airport.new(Airport::CAPACITY, weather) }
  let(:plane) { double(:plane) }
  let(:boeing) { double(:plane) }
  let(:airbus) { double(:plane) }
  let(:weather) { double(:weather, :stormy? => false) }

  describe '#land' do
    it 'allows a plane to land at an airport' do
      expect(airport.land(plane)).to eq([plane])
    end

    it 'allows multiple planes to land in an airport with a larger capacity' do
      airport = Airport.new(2, weather)
      airport.land(boeing)
      expect(airport.land(airbus)).to eq([boeing, airbus])
    end

    it 'prevents landing when the airport is full' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error 'Airport full'
    end

    it 'prevents landing in a larger airport when the airport is full' do
      airport = Airport.new(2, weather)
      airport.land(boeing)
      airport.land(airbus)
      expect { airport.land(plane) }.to raise_error 'Airport full'
    end

    it 'prevents planes that are landed from landing again' do
      airport = Airport.new(2, weather)
      airport.land(boeing)
      expect { airport.land(boeing) }.to raise_error 'Plane already landed'
    end

    it 'raises an error when a plane tries to land when stormy' do
      airport = Airport.new(Airport::CAPACITY, weather)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error 'Too stormy to land'
    end
  end

  describe '#takeoff' do
    it 'removes a plane from the airport' do
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq(plane)
      expect(airport.hangar).to eq([])
    end

    it 'removes a specific plane from the airport' do
      airport = Airport.new(2, weather)
      airport.land(airbus)
      airport.land(boeing)
      expect(airport.takeoff(boeing)).to eq(boeing)
      expect(airport.hangar).to eq([airbus])
    end

    it 'only allows a plane to take off from the airport they are in' do
      heathrow = Airport.new(Airport::CAPACITY, weather)
      stansted = Airport.new(Airport::CAPACITY, weather)
      heathrow.land(plane)
      expect { stansted.takeoff(plane) }.to raise_error 'Plane not in airport'
    end

    it 'raises an error when a plane that is flying tries to take off' do
      expect { airport.takeoff(plane) }.to raise_error 'Plane not in airport'
    end

    it 'raises an error when a plane tries to take off when stormy' do
      airport = Airport.new(Airport::CAPACITY, weather, [plane])
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.takeoff(plane) }.to raise_error 'Too stormy to take off'
    end
  end

  describe '#hangar' do
    it 'has a variable capacity' do
      airport_2 = Airport.new(2)
      expect(airport_2.capacity).to eq(2)
      airport = Airport.new(50)
      expect(airport.capacity).to eq(50)
    end

    it 'has a default capacity if no capacity given' do
      airport = Airport.new
      expect(airport.capacity).to eq(Airport::CAPACITY)
    end
  end
end
