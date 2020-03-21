require 'plane'

describe Plane do
  it "plane responds to #land" do
    expect(Plane.new).to respond_to(:land)
  end
end
