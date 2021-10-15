require "plane"
require "airport"


describe Airport do 
    it 'instructs plane to land at airport' do 
        plane = Plane.new 
        subject.get_plane(plane)
        expect(subject.land).to eq (plane)
    end 

    it 'instruct plane to take off from airport' do 
        plane = Plane.new 
        subject.take_off(plane)
        expect(subject.plane_gone).to eq (true)
        
    end 

    it 'prevents landing when airport is full ' do 
        plane = Plane.new
        expect{ subject.land}.to raise_error 'Airport is full'

    end 

    
end 