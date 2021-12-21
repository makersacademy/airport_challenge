require "plane"
describe Plane do
  it "given a destination take you to that location" do
    plane = Plane.new
    expect(plane).to respond_to(:destination)
  end
end
