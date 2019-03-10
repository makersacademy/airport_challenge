require "air_traffic_control"

describe AirTrafficControl do
  it { is_expected.to respond_to(:land).with(2).arguments }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it "can check if a plane is in an airport" do
    plane = instance_double("Plane")
    airport = instance_double("Airport")
    subject.take_off(plane)
    expect(subject.find_plane(plane, airport)).to eq false
  end
end
