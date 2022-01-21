require 'airport'
require 'plane'

describe Airport do
  it "allows ATC to instruct a plane to land" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq("Plane landed at airport")
  end

  it "allows ATC to instruct a plane to take off" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.take_off(plane)).to eq("Plane has taken off")
  end
end
