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

    xit 'a plane cannot land if the airport is full'

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
