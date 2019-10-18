require "./lib/airport"
require "./lib/plane"

describe Airport do
  it "can receive a landing plane" do
    @airport = Airport.new
    @airport.land_plane(@plane.land)
    expect(@airport.hangar.length).to eq 1
  end
end
