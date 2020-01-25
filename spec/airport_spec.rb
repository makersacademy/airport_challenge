require 'airport' 

describe Airport do 
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

    describe '#land' do 
        it 'should prevent planes for landing when airport is full' do 
            10.times {subject.land Plane.new }
            expect { subject.land Plane.new }.to raise_error 'no space available'
        end 
    end 
end 