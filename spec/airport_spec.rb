require 'airport'
require 'plane'

describe Airport do
  it "lands a plane at an airport" do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
end
