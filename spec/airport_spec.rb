require 'airport' 

describe Airport do 
    it 'should let plane land' do 
    plane = Plane.new
    airport = Airport.new
        expect(airport.land(plane)).to eq [plane]
    end 

    it 'removes plane from storage when taking off' do 
        plane = Plane.new
        airport = Airport.new
        subject.land(plane)
        expect(subject.take_off).to eq []
    end 

end 