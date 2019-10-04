require "air_traffic_controller"
require "Plane"

describe AirTrafficController do
  it "intructs a plane to land" do
    plane = Plane.new

    instruct_landing = subject.plane_landing(plane)

    expect(subject.hanger).to include(plane)
  end

  it "plane taking off" do
    plane = Plane.new

    plane_leaving = subject.plane_taking_off(plane)

    expect(subject.hanger).to_not include(plane)
  end
end
