require './lib/plane'
require './lib/airport'

describe Plane do
  it "lands at the designated airport when instructed" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.hangar).to include(plane)
    expect(plane.land(airport)).to eq plane
  end
end
