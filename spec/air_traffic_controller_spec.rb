require "air_traffic_controller"
require "Plane"

describe AirTrafficController do
  it "intructs a plane to land" do
    subject = AirTrafficController.new(10)

    plane = double(:plane, full?: true)
    subject.capacity.times { subject.plane_landing(plane) }

    expect{ subject.plane_landing(plane) }.to raise_error "hanger full"
  end

  it "plane taking off" do
    plane = Plane.new

    plane_leaving = subject.plane_taking_off(plane)

    expect(subject.hanger).to_not include(plane)
  end

end
