require "./lib/airport"
require "./lib/plane"

describe Airport do
  it "can receive a landing plane" do
    @airport = Airport.new
    @plane = Plane.new
    @airport.land_plane(@plane)
    p @airport.hangar
    expect(@airport.hangar.length).to eq 1
  end
end
