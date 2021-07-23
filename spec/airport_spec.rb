require "airport"

describe "Tests for the landing of planes" do
  it "can land a plane" do
    airport = AirPort.new
    plane = Plane.new
    expect(airport.land(plane)).to eq(plane)
  end
end
