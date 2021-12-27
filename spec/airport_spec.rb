# This is the file that the spec file goes to check for the airport class
require 'airport'

describe Airport do 
    subject(:airport) { described_class.new(20) }

    it 'instructs a plane to land (responds to land method)' do 
        expect(airport).to respond_to(:land).with(1).argument
    end 

    it 'instructs a plane to take off' do 
        expect(airport).to respond_to(:take_off).with(1).argument
    end 

    it 'does not allow landing when at capacity' do
        # creating a double for the plane class
        airport = double :plane
        20.times do
            airport.land(plane)
        end 
        expect { airport.land(plane) }.to raise_error "Airport is full, cannot land the plane"
    end 
end 