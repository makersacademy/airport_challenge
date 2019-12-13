require 'airport'

describe Plane do
  it "lands a plane" do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end
end
