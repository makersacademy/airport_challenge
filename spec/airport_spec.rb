require "airport"
require "plane"

describe Airport do
#User Story 1
  it "responds to message land" do
    airport = Airport.new
    expect(airport).to respond_to(:land)
  end

  it "adds a plane to contents when it has landed a plane" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.contents).to include(plane)
  end

#User Story 2
  it "responds to message takeoff" do
    airport = Airport.new
    expect(airport).to respond_to(:take_off)
  end

  it "no longer contains a plane once it has taken off" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.contents).not_to include(plane)
  end

  it "confirms take off has occurred" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq("Take off complete")
  end 

end
