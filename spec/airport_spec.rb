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

        it 'tests that a plane is stored in airport upon landing' do
            weather1 = double("weather1")
            allow(weather1).to receive(:stormy?).and_return(false)
            airport1 = Airport.new(1, weather1)
            plane1 = double("plane1")
            allow(plane1).to receive(:flying?).and_return(true)
            expect(airport1.land(plane1)).to eq airport1.planes
        end

        it 'tests that a non flying plane cannot land at an airport' do
            weather1 = double("weather1")
            allow(weather1).to receive(:stormy?).and_return(false)
            airport1 = Airport.new(1, weather1)
            plane1 = double("plane1")
            allow(plane1).to receive(:flying?).and_return(false)
            expect { airport1.land(plane1) }.to raise_error('Plane is not flying')
        end

        it 'tests that a plane cannot land if the airport is at capacity' do
            weather1 = double("weather1")
            allow(weather1).to receive(:stormy?).and_return(false)
            airport1 = Airport.new(0, weather1)
            plane1 = double("plane1")
            allow(plane1).to receive(:flying?).and_return(true)
            expect {airport1.land(plane1) }.to raise_error('Airport is at capacity')
        end

        it 'tests that a plane cannot land if weather is stormy?' do
            weather1 = double("weather1")
            allow(weather1).to receive(:stormy?).and_return(true)
            airport1 = Airport.new(1, weather1)
            plane1 = double("plane1")
            allow(plane1).to receive(:flying?).and_return(true)
            expect { airport1.land(plane1) }.to raise_error('Weather conditions do not permit landing')
        end
    end

end