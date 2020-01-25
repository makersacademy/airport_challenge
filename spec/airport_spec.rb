require 'airport' 

describe Airport do 
    let(:capacity) { Airport.new.airport_capacity }

    it 'should let plane land' do 
    plane = Plane.new
    airport = Airport.new
        expect(airport.land(plane)).to eq [plane]
    end 

    it 'removes plane from storage when taking off' do 
        plane = Plane.new
        subject.land(plane)
        expect(subject.take_off).to eq []
    end 
    
    it 'should prevent planes for landing when airport is full' do 
        capacity.times {subject.land Plane.new }
        expect { subject.land Plane.new }.to raise_error 'no space available'
    end 

end 