require "airport"
require "plane"

describe Airport do

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


end
