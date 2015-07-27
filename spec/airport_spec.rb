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

    it 'returns the array airport' do
      airport = Airport.new "Paris"
      expect(airport).to respond_to :airport
    end

    it 'has a location' do
      airport = Airport.new "Paris"
      expect(airport.location).to eq "Paris"
    end

    describe 'take off' do
      it 'instructs a plane to take off' do
       airport = Airport.new "Paris"
       expect(airport).to respond_to :inst_take_off
     end

      describe '#release_plane' do

        it 'requires a function to release a plane' do
          airport = Airport.new "Paris"
          expect(airport).to respond_to :release_plane
        end

        it 'to release a plane it requires an argument plane' do
          airport = Airport.new "Paris"
          expect(airport).to respond_to(:release_plane).with(1).argument
        end

        # it 'releases a plane from the airport' do
        #   plane = Plane.new "Paris" 
        #   airport1 = Airport.new "Paris"
        #   airport1.receive_plane plane
        #   v = airport1.airport.length
        #   expect(airport1.release_plane(plane).length).to eq (v - 1)
        # end

        #test plane taking off
        #test get.chomp

        it 'check plane destination' do
          plane_london = Plane.new "London"
          airport = Airport.new "Paris"
          allow(airport).to receive(:weather?).and_return(false) 
          expect {airport.release_plane plane_london}.to raise_error 'wrong location we cannot release this plane'
        end

      end

   end

    describe 'landing' do
      it 'instructs a plane to land' do 
        airport = Airport.new "Paris"
        expect(airport).to respond_to :inst_landing
      end

      describe '#receive_plane' do
        it 'receives a plane' do
          airport = Airport.new "Paris"
          expect(airport).to respond_to :receive_plane
        end

         it 'to receive a plane it requires an argument plane' do
          airport = Airport.new "Paris"
          expect(airport).to respond_to(:receive_plane).with(1).argument
        end

        it 'adds a plane to the airport once a plane is received' do
          plane = Plane.new "Paris" 
          test_airport = Airport.new "Paris"
          v = test_airport.airport.length
          allow(test_airport).to receive(:weather?).and_return(false) 
          expect(test_airport.receive_plane(plane).length).to eq (v + 1)
        end

        it 'check plane destination' do
          plane_london = Plane.new "London"
          airport = Airport.new "Paris"
          allow(airport).to receive(:weather?).and_return(false) 
          expect {airport.receive_plane plane_london}.to raise_error 'wrong location we cannot accept this plane'
        end
    end
end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        airport = Airport.new "Paris"
        allow(airport).to receive(:weather?).and_return(false) 
        airport.capacity.times{ airport.receive_plane Plane.new "Paris" } 
        expect {airport.receive_plane Plane.new "Paris"}.to raise_error 'airport is full' 
      end

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
        plane = Plane.new "Paris"
        airport = Airport.new "Paris"
        airport.receive_plane plane
        allow(airport).to receive(:weather?).and_return(true) 
        expect {airport.release_plane plane}.to raise_error 'the weather does not allow to take off'  
      end

      it 'does not allow a plane to land' do
        plane = Plane.new "Paris"
        airport = Airport.new "Paris"
        allow(airport).to receive(:weather?).and_return(true)  
        expect {airport.receive_plane plane}.to raise_error 'the weather does not allow to land'
      end

    end
  end
end
