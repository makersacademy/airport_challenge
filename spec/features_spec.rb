describe 'Airport Features' do

    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
      it 'So passengers get to destination, instruct a plane to land' do
        airport = Airport.new
        plane = Plane.new
        #below should work without raising an error
        expect { airport.land(plane) }.not_to raise_error
      end
    end