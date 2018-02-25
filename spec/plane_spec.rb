require 'plane'

describe Plane do
  it "can create new plane objects with names" do
    plane = Plane.new("BA-123")
    expect(plane).to be_instance_of Plane
    expect(plane.name).to eq "BA-123"
  end
end
