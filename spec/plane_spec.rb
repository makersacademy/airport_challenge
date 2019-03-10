require "plane"
require 'airport'

describe Plane do
  it "responds to a plane" do
    plane = Plane.new
    expect(plane).to respond_to(:a_plane)
  end
end
