require 'airport'
require 'plane'


describe 'Airport' do
    let(:plane) { Plane.new }
    
    it 'instructs a plane to land at the airport' do
        expect(subject).to respond_to(:land).with(1).argument
    end

    it 'instructs a plane to take off from the airport' do
        expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'checks whether a plane that has taken off is no longer at the airport' do
        subject.take_off(plane)
        expect(subject.planes).not_to include(plane)
    end

    it 'checks the weather' do
        expect(subject).to respond_to(:weather)
    end

    it 'raises exception if take_off is attempted in stormy weather' do
        expect{subject.take_off(plane)}.to raise_error('Cannot take off, weather stormy') if subject.weather == 'stormy'
    end

    it 'raises exception if land is attempted in stormy weather' do
        expect{subject.land(plane)}.to raise_error('Cannot land, weather stormy') if subject.weather == 'stormy'
    end

    it 'raises exception if land is attempted when airport is full' do
        expect{subject.land(plane)}.to raise_error('Cannot land, airport full') if subject.planes.size == capacity
    end

    it 'allows default capacity of an airport to be overridden if required' do
        random_capacity = Random.rand(1000)
        subject = Airport.new(random_capacity)
        expect(subject.capacity).to_eq random_capacity
    end

end