require 'airport' 
require 'weather'

describe Airport do 
    let(:airport) { Airport.new }
    let(:capacity) { Airport.new.airport_capacity }
    let(:stormy) { Weather.new.stormy? }
    it 'should let plane land' do 
        plane = Plane.new
        airport = Airport.new
        expect(airport.land(plane)).to eq [plane]
    end 

    it 'removes plane from storage when taking off' do 
        plane = Plane.new
        subject.land(plane)
        stormy = false
        expect(subject.take_off).to eq []
    end 
    
    it 'should prevent planes for landing when airport is full' do 
        capacity.times {subject.land Plane.new }
        expect { subject.land Plane.new }.to raise_error 'no space available'
    end 

    it 'should prevent take off when weather is stormy' do 
        allow(subject).to receive(:stormy?) { false }
        expect { airport.take_off }.to raise_error 'too stormy to takeoff'
    end 

    
    # expect(subject.take_off(plane)).to eq plane
end 