require "plane"
require "airport"


describe Airport do 
    it 'instructs plane to land at aiport' do 
        plane = Plane.new 
        subject.get_plane(plane)
        expect(subject.land).to eq (plane)
    end 

    it 'instruct plane to take off from airport' do 
        plane = Plane.new 
        subject.take_off(plane)
        expect(subject.plane_gone).to eq (true)
        
    end 

    # it 'confirm take off plane is not in airport ' do 
    # end 
end 