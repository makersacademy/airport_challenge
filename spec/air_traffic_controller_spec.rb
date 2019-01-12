require 'airport'

describe AirTrafficControl do
  it "can instruct a PLANE to land at an AIRPORT" do
    expect(subject).to respond_to(:land).with(2).arguments
    expect { subject.land(Plane.new, Airport.new) }.to_not raise_error
  end
end
