require 'airport'

describe Airport do
  it "responds to plane_landing method" do
    expect(subject).to respond_to :plane_landing
  end

  it { is_expected.to respond_to(:plane_landing).with(1).argument}

  it "allows planes to take_off" do
    expect(subject).to respond_to :plane_takeoff
  end

  it "can confirm whether an airplane has landed" do
    plane1 = Plane.new
    expect(subject.plane_landing(plane1)).to eq subject.avail_planes
  end

  it "allows planes that have landed to take_off" do
    plane1 = Plane.new
    subject.plane_landing(plane1)
    expect(subject.plane_takeoff).to eq plane1
  end
end
