require 'airport'

describe Airport do
  it { is_expected.to respond_to(:planes) }
  it "can instruct a PLANE to LAND" do
    expect(subject).to respond_to(:land).with(1).arguments
    expect { subject.land(Plane.new) }.to_not raise_error
  end
  it "stores LANDed planes in PLANES" do
    pointer = Plane.new
    subject.land(pointer)
    expect(subject.planes.include?(pointer)).to eq(true)
  end

  it "can instruct a PLANE to TAKEOFF" do
    expect(subject).to respond_to(:takeoff).with(1).arguments
    expect { subject.takeoff(Plane.new) }.to_not raise_error
  end
  it "can confirm taken off plane no longer exists in airport" do
    pointer = Plane.new
    subject.land(pointer)
    subject.takeoff(pointer)
    expect(subject.planes.include?(pointer)).to eq(false)
  end
end
