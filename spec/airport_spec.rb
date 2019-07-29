require 'airport'

describe Airport do

    describe '#landing' do
        it 'allows a plane to land at the airport' do
            plane = Plane.new
            airport = Airport.new
            expect(subject.landing(plane)).to eq [plane]
        end
    end

    describe '#departing' do
        it 'plane departs from an airport' do
            plane = Plane.new
            airport = Airport.new
            expect( airport.departing).to eq [plane].or raise_error
        end

        it 'if plane is departing, raise an error if weather is stormy' do
            expect{subject.departing}.to raise_error 'cant fly due to storm'
        end

        it 'raises an error if no planes are at airport to depart' do
            expect {subject.departing}.to raise_error 'no planes at the airport'
        end
    end

    it 'allows airport to have default capacity' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
   

    it 'returns the landed plane' do
        expect(subject).to respond_to (:plane)
    end
    
end