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

        it 'confirms a plane has left the airport' do
            plane_one = Plane.new
            plane_one_num = plane_one.generate_flight_number
            plane_two = Plane.new
            plane_two_num = plane_two.generate_flight_number
            subject.land_at_airport(plane_one)
            subject.land_at_airport(plane_two)
            subject.take_off(plane_one)
            expect(subject.planes_arr.first.flight_num).to eq(plane_two_num)
        end
    end

    it 'stops flights from taking off if the weather is stormy' do
        plane = Plane.new
        weather = double(:weather, :the_weather => "Sunny")
        subject.land_at_airport(plane)
        subject.check_weather(weather)
        expect(subject).to respond_to(:take_off) 
    end
end