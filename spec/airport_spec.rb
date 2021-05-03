require 'airport'

describe Airport do
    subject(:airport) { described_class.new }
    let(:plane) { double(:plane) }
    describe '#land' do
        it 'instructs a plane to land at the airport safely' do
            allow(airport).to receive(:stormy?).and_return(false)
            expect(airport).to respond_to(:land).with(1).argument
        end

        it 'raises an error when airport is full when a plane tries to land' do
            allow(airport).to receive(:stormy?).and_return(false)
            20.times { airport.land(double(:plane)) }
            expect { airport.land(double(:plane)) }.to raise_error 'Airport Full: Cannot Land'
        end

        it 'does not allow a plane to land in stormy weather' do
            allow(airport).to receive(:stormy?).and_return(true)
            expect { airport.land(double(:plane)) }.to raise_error('Stormy: Cannot Land')
        end

        it 'does not allow a plane to land again' do
            airport = Airport.new
            plane = (double(:plane))
            allow(airport).to receive(:stormy?).and_return(false)
            airport.land(plane)
            expect { airport.land(plane) }.to raise_error('Plane Already Landed')
        end
    end

    describe '#take_off' do
        it 'instructs a plane to take off from the airport safely' do
            expect(airport).to respond_to(:take_off).with(1).argument
        end

        it 'instructs a plane to take off and remove from airport' do
            airport = Airport.new
            plane = (double(:plane))
            plane1 = (double(:plane))
            allow(airport).to receive(:stormy?).and_return(false)
            airport.land(plane)
            airport.land(plane1)
            expect(airport.take_off(plane1)).to eq(plane1)
        end

        it 'does not allow a plane to takeoff in stormy weather' do
            allow(airport).to receive(:stormy?).and_return(true)
            expect { airport.take_off((double(:plane))) }.to raise_error('Stormy: Cannot Takeoff')
        end
    end

    it 'lands and  takesoff a number of planes' do
        airport = Airport.new(5)
        plane1 = (double(:plane))
        plane2 = (double(:plane))
        plane3 = (double(:plane))
        plane4 = (double(:plane))
        plane5 = (double(:plane))
        plane6 = (double(:plane))
        allow(airport).to receive(:stormy?).and_return(false)
        airport.land(plane1)
        airport.land(plane2)
        airport.land(plane3)
        airport.land(plane4)
        airport.land(plane5)
        airport.take_off(plane4)
        airport.land(plane6)
        expect(airport.planes).to eq([plane1, plane2, plane3, plane5, plane6])
    end
end