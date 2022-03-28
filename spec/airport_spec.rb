require 'airport'

describe Airport do
    it "Instruct plane to land at airport" do
    plane = Plane.new
    airport = Airport.new
    airport.instruct_land(plane)
    p airport.hangar
    expect(airport.hangar[0]).to have_attributes(:key => "grounded"))
    end
    end

    it "Instruct plane to take off from airport and confirm it is no longer in airport" do
    airport = Airport.new
    plane = Plane.new
    end
end