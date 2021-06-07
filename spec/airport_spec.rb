require 'airport'

describe Airport do
    subject(:airport) { described_class = new(20) }
    let(:plane) {double :plane}

    describe '#land' do
        it 'instructs a plane to land' do
            airport = Airport.new(20)
            expect(airport).to respond_to(:land).with(1).argument
        end

        context 'when full' do
            it 'raises an error' do
                airport = Airport.new(20)
                20.times do 
                    airport.land(plane)
                end
                expect { airport.land(plane) }.to raise_error 'Cannot land plane, airport is full!'
            end
        end
        
    end

    describe '#take_off' do

        it 'instructs a plane to take off' do
            airport = Airport.new(20)
            expect(airport).to respond_to(:take_off).with(1).argument
        end

        it 'confirms a plane has taken off' do
            airport = Airport.new(20)
            plane1 = Plane.new
            airport.land(plane1)
            plane2 = Plane.new
            airport.land(plane2)
            expect(airport.take_off(plane2)).to eq 1
        end
    end

end