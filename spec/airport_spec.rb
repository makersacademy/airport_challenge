require_relative "../lib/airport"

describe Airport do
    
    it 'expect airport to responds to calling "land_plane' do
        expect(subject).to respond_to(:land_plane)
    end

    it 'expect airport to be able to land a plane at the airport' do
        expect(subject.land_plane(plane)).to eq(plane)
    end
end
