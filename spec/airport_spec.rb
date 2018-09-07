require_relative "../lib/airport"

describe Airport do
    
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport

    it 'expect airport to responds to calling "land_plane' do
        expect(subject).to respond_to(:land_plane)
    end

    it 'expect airport to be able to land a plane at the airport' do
        plane = Plane.new
        expect(subject.land_plane(plane)).to eq(plane)
    end
end
