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

  let(:airport) {Airport.new}

  context 'taking off and landing' do

    it 'a plane can land' do
      plane = Plane.new
      expect(plane).to respond_to :land
    end

    it 'a plane can take off' do
      plane = Plane.new
      expect(plane).to respond_to :take_off
    end
  end

  context 'traffic control' do


    it 'can get permission to land' do
      expect(airport).to respond_to :permission_to_land
    end

    it 'a plane cannot land if the airport is full' do
    #implies the airport has capacity, therefore we
    #we need to define this
    #if airport is at capacity
      plane = Plane.new
      airport.capacity.times {airport.permission_to_land plane}
      expect { (airport.permission_to_land plane) }.to raise_error 'Permission denied'
    end

    xit 'planes cannot take off from airport if airport is empty' do
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
      xit 'a plane cannot take off when there is a storm brewing' do
        #expect landed plane not to respond to take_off
        #if stormy_weather returns true
        expect(airport).not_to respond_to :take_off
      end

      it 'a plane cannot land in the middle of a storm' do
        #want a method called stormy, if stormy equals true
        #(this generated randomly) then the plane cannot land.
        plane = double(:plane)
        allow(airport).to receive(:stormy?).and_return(true)
        expect{ (airport.permission_to_land :plane) }.to raise_error "Weather is stormy"
      end



    end
  end
end
