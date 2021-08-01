require "airport"
describe Airport do 
    airport = Airport.new()
    it "responds to land_plane" do 
        expect(airport.land_plane("plane_1")).to eq "plane_1"
    end 
end 