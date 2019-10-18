require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather.rb'

describe Plane do
    it 'creates an instance of the Plane class' do
        expect(subject).to be_a(Plane)
    end

    describe '#generate_flight_number' do
        it 'creates a string that returns 16 characters' do
            flight_number = subject.flight_number
            expect(flight_number.count).to eq(16)
        end
    end
end