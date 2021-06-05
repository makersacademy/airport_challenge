require 'airport'

describe Airport do
    subject(:airport) { described_class = new }
    
    it 'instructs a plane to land' do
        airport = Airport.new
        expect(airport).to respond_to(:land).with(1).argument
    end

    it 'instructs a plane to take off' do
        airport = Airport.new
        expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'confirms a plane has taken off' do
        airport = Airport.new
        plane1 = Plane.new
        airport.land(plane1)
        plane2 = Plane.new
        airport.land(plane2)
        expect(airport.take_off(plane2)).to eq 1
    end

end