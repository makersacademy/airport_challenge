require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do
    it 'creates an instance of the airport class' do
        expect(subject).to be_a(Airport)
    end

    it 'should have an empty array of planes' do
        expect(subject.planes_arr).to be_empty
    end

    describe '#land_at_airport' do
        it 'adds a plane to the planes array' do
            plane = Plane.new
            subject.land_at_airport(plane)
            expect(subject.planes_arr).to include(plane)
        end
    end

    describe '#take_off' do
        it 'makes a plane take off if there is one in the array' do
            plane = Plane.new
            subject.land_at_airport(plane)
            subject.take_off(plane)
            expect(subject.planes_arr).to be_empty
        end
    end
end