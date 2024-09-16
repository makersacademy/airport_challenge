require 'plane'

describe Plane do
  it "Expects plane to respond to landed? method" do
    plane = Plane.new
    expect(plane).to respond_to(:landed?)
  end
end
