require "./lib/airport"
require "./lib/plane"

describe Airport do
  before :each do
    @airport = Airport.new
    @plane = Plane.new
  end

  it "can receive a landing plane" do
    @airport.land_plane(@plane)
    expect(@airport.runway.length).to eq 1
  end

  it "can allow planes to take off" do
    @airport.land_plane(@plane)
    @airport.allow_take_off
    expect(@airport.runway).to be_empty
  end

  it "does not allow landing in stormy weather" do
    expect { @airport.land_plane(@plane, stormy) }.to raise_error("Planes cannot land in stormy weather")
  end
end
