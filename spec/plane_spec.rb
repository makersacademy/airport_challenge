require "plane"

describe Plane do

  it "can land" do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end

end
