require 'plane'

describe Plane do
  plane = Plane.new
  it "Check if plane exists" do
    expect(plane).to be_a Plane
  end
end
