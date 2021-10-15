require "plane"
require "airport"


describe Airport do 
    it 'instructs plane to land at aiport' do 
        plane = Plane.new 
        subject.get_plane(plane)
        expect(subject.land).to eq (plane)
    end 
end 