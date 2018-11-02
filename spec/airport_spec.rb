require 'airport'

describe Plane do
  it "expects a new plane to be created" do
    expect(Plane.new).to_not eq nil
  end
  it "allows a plane to call #land" do
    expect(subject).to respond_to(:land)
  end
end