require "airport"

describe Plane do
  it "expects a new plane to be created" do
    expect(Plane.new).to_not eq nil
  end
  it "expects a plane to #land" do
    expect(subject).to respond_to(:land)
  end
  it "expects a plane to #takeoff" do
    expect(subject).to respond_to(:takeoff)
  end
end