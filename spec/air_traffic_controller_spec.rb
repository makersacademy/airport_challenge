require 'airport'

describe Airport do
  it "can instruct a PLANE to LAND" do
    expect(subject).to respond_to(:land).with(1).arguments
    expect { subject.land(Plane.new) }.to_not raise_error
  end
  it "can instruct a PLANE to TAKEOFF" do
    expect(subject).to respond_to(:takeoff).with(1).arguments
  end
end
