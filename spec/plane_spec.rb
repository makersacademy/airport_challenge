require "plane"

describe Plane do
  it "expects a new plane to be created" do
    expect(Plane.new).to_not eq nil
  end
end