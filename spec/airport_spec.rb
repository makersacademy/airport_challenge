require 'airport'
require 'plane'

describe Airport do
  it "accepts planes to land" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land_plane(plane)).to eq plane
  end
end
