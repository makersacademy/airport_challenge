require 'airport'
require 'weather'

describe Airport do

    it 'should respond to land' do
        expect(Airport.new).to respond_to(:land).with(1).argument
    end

    it 'reports plane in hangar' do
        plane = Plane.new
        expect(subject.land(plane)).to include plane
    end

    it 'should repond to take_off' do
        expect(Airport.new).to respond_to(:take_off).with(1).argument
    end

    it 'has a default capacity' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    describe 'initialization' do
        it 'has a variable capacity' do
            airport = Airport.new(50)
            50.times { airport.land(Plane.new) }
            expect { airport.land(Plane.new) }.to raise_error 'Airport is full'

        end
    end

    describe '#land' do
        it 'raises an error when the airport is full' do
            subject.capacity.times { subject.land(Plane.new) }
            expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
        end
    end

    describe '#take_off' do
        it 'raises an error when the weather is stromy' do
            Weather.new.stormy?
            expect { subject.take_off(Plane.new) }.to raise_error 'Plane cannot take off due to stormy weather'
        end
    end

end
