require "plane"
describe Plane do
  it "Making a plane in possible" do
    plane = Plane.new()
  end

  it "A plane is able to land in an airport." do
    plane = Plane.new()
    airport = Airport.new()
    plane.land(airport)
  end
  it "A plane is able to take off from an airport." do
    plane = Plane.new()
    airport = Airport.new()
    plane.take_off(airport)
  end
end
