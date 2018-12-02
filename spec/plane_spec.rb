require "plane"

describe Plane do
  it "lands a plane" do
  expect(subject).to respond_to(:land)
  end

  it "takes off from the airport" do
    expect(subject).to respond_to(:takeoff)
  end
end
