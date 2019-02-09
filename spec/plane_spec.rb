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

  it " When a plane has landed in the airport, it is  in airport." do
    plane = Plane.new()
    airport = Airport.new()
    plane.land(airport)
    expect(plane.is_in?(airport)).to eq true

  end

  it "when a plane has taken off the airport, it is not in airport anymore." do
    plane = Plane.new()
    airport = Airport.new()
    plane.land(airport)
    plane.take_off(airport)
    expect(plane.is_in?(airport)).to eq false
  end

end
