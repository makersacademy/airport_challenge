require 'plane'

describe Plane do
  it "can land at an airport" do
    plane = Plane.new
    expect(plane).to respond_to(:land).with(1).argument
  end
end
