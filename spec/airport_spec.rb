require './lib/airport'
require './lib/plane'

describe Airport do
  
  it "allows plane to land at airport" do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to respond_to(:land_plane)
  end
end
