require 'plane'

describe Plane do

# Arrange
  it "must create a plane" do
    plane = Plane.new
  end

  it "the plane must be able to land" do
    plane = Plane.new
    expect(plane.land).to eq "Message to land received"
  end

end

