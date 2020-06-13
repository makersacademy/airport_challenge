require('airport')

describe 'airport' do

    it 'creates a new class of airport' do
        expect(Airport.new).to be_an_instance_of(Airport)
    end

    it 'allows a plane to land at an airport' do
        airport = Airport.new
        plane = Plane.new
        expect(airport.land(plane)).to eq("The plane has landed")
    end

    it 'allows a plane to take off' do
        airport = Airport.new
        plane = Plane.new
        expect(airport.takeoff(plane)).to eq(true)
    end

    it 'expects there to be an empty array for planes as a default' do
        airport = Airport.new
        expect(airport.planes).to eq([])
    end

    it 'expects a landing to be prevented if airport is full' do
        airport = Airport.new
        plane1 = Plane.new
        plane2 = Plane.new
        airport.land(plane1)
        expect(airport.land(plane2)).to eq("fail")
    end

end