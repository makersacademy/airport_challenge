describe 'Airport Features' do

    # 1. User Story
      it 'so passengers get to destination, instruct a plane to land' do
        airport = Airport.new
        plane = Plane.new
        #below should work without raising an error
        expect { airport.land(plane) }.not_to raise_error
      end
    

    # 2. User Story
      it 'so planes can take off from airport, instructe plane to take off'do
        airport = Airport.new
        plane = Plane.new
        expect { airport.take_off(plane) }.not_to raise_error
      end
end