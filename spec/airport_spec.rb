require 'airport'
require 'plane'

describe Airport do
    subject(:airport) {described_class.new}
    describe '#land' do
        it 'is expected to respond to the method "land" with 1 argument' do
            expect(airport).to respond_to(:land).with(1).argument
        end
        it 'is expected to output an error message if landing is attempted in stormy weather' do
            plane = Plane.new
            airport.weather = 'stormy'
            expect { airport.land(plane) }.to raise_error 'Cannot land: Weather is stormy' 
        end

    end

    describe '#take_off' do
        it 'is expected to respond to the method "take_off" with 1 argument' do
            expect(airport).to respond_to(:take_off).with(1).argument
        end
        it 'is expected to respond to the method "take_off" and return a success message' do
            plane = Plane.new
            expect {airport.take_off(plane)}.to output("Take-off: Successful\n").to_stdout
        end
        it 'is expected to output an error message if take-off is attempted in stormy weather' do
            plane = Plane.new
            airport.weather = 'stormy'
            expect { airport.take_off(plane) }.to raise_error 'Cannot take-off: Weather is stormy'
        end
    end

end