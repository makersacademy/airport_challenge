require "plane"

describe Plane do

  it "can land" do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end

  it "lands at an airport" do
    airport = Airport.new
    plane = Plane.new
    plane.land
    expect(airport.contents).to include(plane)
  end


end
