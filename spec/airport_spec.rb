require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do
  context 'taking off and landing' do
    it { is_expected.to respond_to :landing_permission }
    it { is_expected.to respond_to :request_plane_to_takeoff }
  end

  context 'traffic control' do
    # scenario 'a plane cannot land if the airport is full' do
    #   airport = Airport.new
    #   (airport.capacity).times {}
    # end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
  end

  context 'weather conditions' do
    it 'a plane cannot take off when there is a storm brewing' do
      Airport.any_instance.stub(:weather).and_return(:'stormy')
      airport = Airport.new
      plane = Plane.new
      airport.landing_permission plane
      # airport.weather = double :airport.weather, weather: 'stormy'
      expect(airport.request_plane_to_takeoff plane).to eq 'permission denied'
    end
    it 'a plane cannot land in the middle of a storm' do
      Airport.any_instance.stub(:weather).and_return(:'stormy')
      airport = Airport.new
      plane = Plane.new
      expect(airport.landing_permission plane).to eq 'permission denied'
    end
  end
end
