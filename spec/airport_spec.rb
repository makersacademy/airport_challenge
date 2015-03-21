require 'airport'

describe Airport do

  context 'taking off and landing' do
    it 'a plane can land' do
      airport = Airport.new
      plane = Plane.new
      airport.arrival(plane.land)
      expect(airport.stationed_planes.last).to eq plane
    end

    it 'a plane can take off' do
      airport = Airport.new
      plane = Plane.new
      airport.arrival(plane)
      airport.departure(plane.take_off)
      expect(airport.stationed_planes.last).to eq nil
    end

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      airport = Airport.new
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { airport.arrival(plane.land) }
      expect { airport.arrival(plane.land) }. to raise_error "Airport Full"
    end

    it 'can set a custom capacity' do
      random_capacity = rand(1..100)
      airport = Airport.new(random_capacity)
      expect(airport.capacity).to eq random_capacity
    end

    it 'a plane cannot take off if it is not present' do
      airport = Airport.new
      plane = Plane.new
      airport.arrival(plane.land)
      airport.departure(plane.take_off)
      expect { airport.departure(plane.take_off) }.to eq
    end
    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do
      xit 'a plane cannot take off when there is a storm brewing'

      xit 'a plane cannot land in the middle of a storm'
    end
  end
end
