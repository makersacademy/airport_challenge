require "./lib/airport"
require "./lib/plane"

describe Airport do
  it "can receive a landing plane" do
    @airport = Airport.new
    @plane = Plane.new
    @airport.land_plane(@plane)
    p @airport.runway
    expect(@airport.runway.length).to eq 1
  end
end
