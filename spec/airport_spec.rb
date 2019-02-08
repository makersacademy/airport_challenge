require 'airport'

describe Airport do
  it "can instruct a plane to land" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.planes).to include(plane)
  end

  it "can instruct a plane to take off" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).not_to include(plane)
  end

  it "can check whether a plane is at the airport" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.has_plane?(plane)).to be(false)
  end
end
