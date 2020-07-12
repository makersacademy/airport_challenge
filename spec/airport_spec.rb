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
            expect(subject.land).to eq subject.planes
        end

        it 'fails if landing plane not flying' do
            plane1 = double("plane1")
            allow(plane1).to receive(:flying?).and_return(false)
            expect { Airport.new.land(plane1) }.to raise_error('Plane is not flying')
        end

        it 'fails if airport at capacity' do
            plane1 = double("plane1")
            allow(plane1).to receive(:flying?).and_return(true)
            weather1 = double("weather1")
            allow(weather1).to receive(:stormy?).and_return(false)
            expect {Airport.new(0).land(plane1) }.to raise_error('Airport is at capacity')
        end

        it 'fails if weather returns true to stormy?' do
            plane1 = double("plane1")
            allow(plane1).to receive(:flying?).and_return(true)
            weather1 = double("weather1")
            allow(weather1).to receive(:stormy?).and_return(true)
            expect { Airport.new(1, weather1).land(plane1) }.to raise_error('Weather conditions do not permit landing')
        end
    end

end