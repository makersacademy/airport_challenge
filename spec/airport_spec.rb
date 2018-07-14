require 'airport'
require 'plane'

describe Airport do
    subject(:airport) {described_class.new}
    describe '#initialize' do
        it 'is expected to have a default capacity' do
            Airport::DEFAULT_CAPACITY.times {airport.land(Plane.new)}
            expect(airport.planes.length).to eq Airport::DEFAULT_CAPACITY
        end  
        it 'allows users to override the capacity' do
            expect(Airport.new(5).capacity).to eq 5
        end
    end

    describe '#land' do
        it 'is expected to respond to the method "land" with 1 argument' do
            expect(airport).to respond_to(:land).with(1).argument
        end
        it 'is expected to output an error message if landing is attempted in stormy weather' do
            plane = Plane.new
            allow(airport).to receive(:stormy?) { true }
            expect { airport.land(plane) }.to raise_error 'Cannot land: Weather is stormy' 
        end
        it 'is expected to output an error message if attempt to land when airport is at capacity' do
            Airport::DEFAULT_CAPACITY.times {airport.land(Plane.new)}
            plane = Plane.new
            expect { airport.land(plane) }.to raise_error 'Cannot land: Airport is full'
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
            allow(airport).to receive(:stormy?) { true }
            expect { airport.take_off(plane) }.to raise_error 'Cannot take-off: Weather is stormy'
        end
        it 'removes the plane from the airport' do
            plane = Plane.new
            2.times do
                 airport.land(plane)
                 airport.take_off(plane)
            end
            expect(airport.planes.length).to eq 0
        end
    end

end