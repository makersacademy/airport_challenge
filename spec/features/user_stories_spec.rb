require 'airport'

describe Airport do
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
    
    it 'instructs a plane to land at an airport' do
        airport = Airport.new
        plane = Plane.new
        expect{ airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and 
    # confirm that it is no longer in the airport

    it 'instruct a plane to take off from an airport, then confirm it is no longer at the airport' do
        airport = Airport.new
        plane = Plane.new
        airport.land(plane)
        expect{ airport.take_off(plane) }.not_to raise_error
        expect(airport.take_off(plane)).to eq(0)
    end
end