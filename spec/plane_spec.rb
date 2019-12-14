require "plane"

describe Plane do
  it "expects Plane to make working planes" do
    plane = Plane.new
    expect(plane).to eq plane
  end
end
