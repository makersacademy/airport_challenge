require "airport"
describe Airport do 
    airport = Airport.new([])
    it "instructs a plane to land in an airport" do 
        expect(airport.land_plane("plane_1")).to eq(["plane_1"])
    end
    
    it "instructs a plane to take off from an airport and not be at the airport" do 
        airport = Airport.new([])
        expect(airport.take_off).to eq([])
    end 
end 