require 'airport'
require 'weather'
require'plane'


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

    let(:double_plane){double(:plane, flying: 'flying')}

    it { is_expected.to respond_to :planes }
    it { is_expected.to respond_to :count_planes }

    it 'has a capacity' do
      expect(subject.capacity).to eql 5
    end


    it 'should allow a plane to land' do
      glasgow = Airport.new
      allow(glasgow).to receive(:today_weather) {'sunny'}
      plane = Plane.new
      glasgow.clear_to_land(plane)
      expect(glasgow.planes.count).to eql(1)
    end

    it 'should allow a plane to take off' do
      glasgow = Airport.new
      allow(glasgow).to receive(:today_weather) {'sunny'}
      plane = Plane.new
      glasgow.clear_to_land(plane)
      allow(glasgow).to receive(:today_weather) {'sunny'}
      glasgow.clear_to_take_off(plane)
      expect(glasgow.planes.count).to eql(0)
    end

    it 'should prevent a plane from landing if the airport is full' do
      glasgow = Airport.new
      plane = Plane.new
      allow(glasgow).to receive(:today_weather) {'sunny'}
      5.times {glasgow.clear_to_land(plane)}
      expect {glasgow.clear_to_land(plane)}.to raise_error 'Airport at Capacity'
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport


    context 'when weather conditions are stormy' do

      it 'does not allow a plane to take off' do
        plane = Plane.new
        allow(subject).to receive(:today_weather) {'sunny'}
        subject.clear_to_land(plane)
        allow(subject).to receive(:today_weather) {'sunny'}
        allow(plane).to receive(:flying) {'landed'}
        allow(subject).to receive(:today_weather) {'stormy'}
        expect{ subject.clear_to_take_off(plane) }.to raise_error 'Stormy!'
        end
    end




end
