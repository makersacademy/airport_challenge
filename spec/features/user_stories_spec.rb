require 'airport'

describe Airport do
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
    
    it 'instructs a plane to land at an airport' do
        airport = Airport.new(20)
        plane = Plane.new
        expect{ airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and 
    # confirm that it is no longer in the airport

    it 'instruct a plane to take off from an airport, then confirm it is no longer at the airport' do
        airport = Airport.new(20)
        plane = Plane.new
        airport.land(plane)
        expect{ airport.take_off(plane) }.not_to raise_error
        expect(airport.take_off(plane)).to eq(0)
    end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when the airport is full

    it 'prevents planes landing when airport is full' do
        airport = Airport.new(20)
        plane = Plane.new
        20.times do 
            airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane, airport is full!'
    end

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate

    it '' do

    end 

end