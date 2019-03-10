require "air_traffic_control"

describe AirTrafficControl do
  it { is_expected.to respond_to(:land).with(2).arguments }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it "can confirm a plane is not in an airport when it has been instructed to take off using confirm_plane_absence" do
    plane = Plane.new # instance_double("Plane")
    airport = Airport.new # instance_double("Airport")
    subject.take_off(plane)
    expect(subject.confirm_plane_absence(plane, airport)).to eq true
  end
  it "returns false when confirm_plane_absence is used with a plane that has landed at the airport passed in" do
    plane = Plane.new # instance_double("Plane")
    airport = Airport.new # instance_double("Airport")
    subject.land(plane, airport)
    expect(subject.confirm_plane_absence(plane, airport)).to eq false
  end
end
