# We need a plane class that creates new planes
require 'plane'

describe Planes do
  it "gives you the plane name" do
    plane = Planes.new("name")
    expect(plane.plane_name).to eq "name"
  end

end
