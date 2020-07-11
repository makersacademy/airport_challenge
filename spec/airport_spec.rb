require_relative '../lib/airport.rb'

describe Airport do
    describe '#capacity' do
        it 'capacity has a default value if none provided' do
            expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
        end
        it 'capacity can be set by user' do
            expect(Airport.new(20).capacity).to eq 20
        end
    end

    describe '#land(plane=Plane.new)' do
        it 'stores a plane in airport array' do
            airport1 = Airport.new
            expect(airport1.land).to eq airport1.planes
        end
    end
end