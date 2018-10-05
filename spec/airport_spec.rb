require 'airport'

describe Airport do
  it { is_expected.to respond_to :release_plane }

  it "releases a plane that has landed" do
    plane = subject.release_plane
    expect(plane).to be_landed
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:plane) }

  it "lands the plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it "returns the landed planes" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end
end
