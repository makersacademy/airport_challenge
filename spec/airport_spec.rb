require "airport"

describe "Tests for the landing of planes" do
  it "can land a plane at an airport" do
    airport = AirPort.new
    plane = Plane.new
    hanger = [plane]
    airport.land(plane)
    expect(airport.airport_hanger).to eq(hanger)
  end
  
  it "a specific plane can takeoff from a hanger of multiple" do
    airport = AirPort.new
    plane = Plane.new
    plane2 = Plane.new
    airport.land(plane)
    airport.land(plane2)
    expect(airport.takeoff(plane)).to eq(plane)
  end
end
