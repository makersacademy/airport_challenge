# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
require 'airport'
require 'plane'

describe "the land method" do
  it "instruct a plane to land at an airport" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq "Airplane Landed!"
  end
end
