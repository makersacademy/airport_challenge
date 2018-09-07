require_relative "../lib/airport"

describe Airport do
    
    it 'expect airport to responds to calling "land_plane' do
        expect(subject.land_plane).to respond_to(:land_plane)
    end
end