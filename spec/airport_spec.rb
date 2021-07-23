require "airport"

describe "Tests for the landing of planes" do
  it "can land a plane at an airport" do
    airport = AirPort.new
    plane = Plane.new
    hanger = [plane]
    airport.land(plane)
    expect(airport.airport_hanger).to eq(hanger)
  end
end
