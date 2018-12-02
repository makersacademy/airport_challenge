require "plane"

describe Plane do
  it "lands a plane" do
    plane = Plane.new
    expect(subject.land(plane)).equal? plane
  end

  it "takes off from the airport" do
    plane = Plane.new
    expect(subject.takeoff).equal? plane
  end
end
