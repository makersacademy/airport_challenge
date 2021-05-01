describe 'User Stories' do
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
    it 'lands a plane at the airport after instruction to land' do
        airport = Airport.new
        plane = Plane.new
        expect { airport.land(plane) }.not_to raise_error
    end
    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'lets a plane take off so it is no longer at the airport' do
        airport = Airport.new
        plane = Plane.new
        expect { airport.take_off(plane) }.not_to raise_error
    end
end

# describe 'User Story 2' do
#     # As an air traffic controller 
#     # So I can get passengers on the way to their destination 
#     # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
#     it 'lets a plane take off so it is no longer at the airport'
#     airport = Airport.new
#     plane = Plane.new
#     expect { airport.take_off(plane) }.not_to raise_error
# end