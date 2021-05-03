require 'airport'

describe 'User Stories' do
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
    it 'lands a plane at the airport after instruction to land' do
        airport = Airport.new(20)
        plane = Plane.new
        allow(airport).to receive(:stormy?).and_return(false)
        expect { airport.land(plane) }.not_to raise_error
    end
    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'lets a plane take off so it is no longer at the airport' do
        airport = Airport.new(20)
        plane = Plane.new
        allow(airport).to receive(:stormy?).and_return(false)
        airport.land(plane)
        expect { airport.take_off(plane) }.not_to raise_error
    end
    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when the airport is full 
    it 'prevents a plane from landing when a plane is full' do
        airport = Airport.new(20)
        plane = Plane.new
        allow(airport).to receive(:stormy?).and_return(false)
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error('Airport Full: Cannot Land')
    end
    #As the system designer
    #So that the software can be used for many different airports
    #I would like a default airport capacity that can be overridden as appropriate
    it 'sets the capacity when argument not given' do
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?).and_return(false)
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error('Airport Full: Cannot Land')
    end
    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when weather is stormy
    it 'does not allow a plane to land when it is stormy' do
        airport = Airport.new(20)
        plane = Plane.new
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.land(plane) }.to raise_error('Stormy: Cannot Land')
    end
    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent takeoff when weather is stormy 
    it 'does not allow a plane to takeoff when it is stormy' do
        airport = Airport.new(20)
        plane = Plane.new
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.take_off(plane) }.to raise_error('Stormy: Cannot Takeoff')
    end
end