require 'airport'

describe Airport do
  it "can instruct a plane to land" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.planes).to include(plane)
  end
end
