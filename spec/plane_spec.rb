require 'plane'
require 'airport'

describe Plane do
  it "can land" do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end

  it "knows which airport it has landed at" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(plane.airport).to eq(airport)
  end

end
