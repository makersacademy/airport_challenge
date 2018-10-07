require "./lib/plane.rb"
require "./lib/airport.rb"

describe Plane do
  it "reports that is is flying" do
    plane = Plane.new
    expect(plane.flying?).to eq true
  end
  it "reports as not flying" do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    expect(plane.flying?).to eq false
  end
end
