require 'airport'

RSpec.describe Airport do
    describe 'Airport initialize' do
        it 'allows user to set airport capacity and be overridden' do
           port = Airport.new(200)
           expect(port.capacity).to eq 200
        end
    end

    it 'traffic controller tells plane to land at airport' do
        port = Airport.new
        expect(port.airport_dock(port)).to eq port
    end

    describe 'plane_takeoff_confirmation' do
        it 'tells plane to takeoff and confirms it isnt in airport anymore' do
            plane = Plane.new
            expect(subject.plane_takeoff_confirmation).to eq "WE OUTTA HERE!!"
        end
    end

    it 'prevents landing when airport is full' do
        plane = Plane.new
        airport = Airport.new(1)
        airport.airport_dock(plane)
        expect(airport.full?). to eq true
    end

    it 'rasies an error when plane tries landing in a full airport' do
        plane = Plane.new
        airport = Airport.new(1)
        planes = Plane.new
        airport.airport_dock(plane)
        expect { airport.airport_dock(planes) }.to raise_error 'airport is full'
    end
end
