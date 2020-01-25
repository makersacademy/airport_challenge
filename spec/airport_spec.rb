require 'airport' 

describe Airport do 
    it 'should let plane land' do 
    plane = Plane.new
    airport = Airport.new
        expect(airport.land(plane)).to eq [plane]
    end 
end 