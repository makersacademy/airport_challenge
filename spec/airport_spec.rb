require 'airport'

describe Airport do
    subject(:airport) { described_class.new }

    describe '#land' do
        it 'instructs a plane to land at the airport safely' do
            allow(airport).to receive(:stormy?).and_return(false)
            expect(airport).to respond_to(:land).with(1).argument
        end

        it 'raises an error when airport is full when a plane tries to land' do
            allow(airport).to receive(:stormy?).and_return(false)
            20.times { airport.land(Plane.new) }
            expect { airport.land(Plane.new) }.to raise_error 'Airport Full: Cannot Land'
        end

        it 'does not allow a plane to land in stormy weather' do
            allow(airport).to receive(:stormy?).and_return(true)
            expect { airport.land(Plane.new) }.to raise_error('Stormy: Cannot Land')
        end
    end

    describe '#take_off' do
        it 'instructs a plane to take off from the airport safely' do
            expect(airport).to respond_to(:take_off).with(1).argument
        end

        it 'does not allow a plane to takeoff in stormy weather' do
            allow(airport).to receive(:stormy?).and_return(true)
            expect { airport.take_off(Plane.new) }.to raise_error('Stormy: Cannot Takeoff')
        end
    end
end