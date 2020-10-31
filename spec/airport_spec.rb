# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

require 'airport'
require 'plane'

describe Airport do
  it "instruct a plane to land at an airport" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq 1
  end


# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "take_off method to return updated number of airplanes" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq 0
  end
end
