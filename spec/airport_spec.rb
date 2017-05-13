require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to :landed_planes }
  it { is_expected.to respond_to(:clear_plane).with(1).argument }
  it { is_expected.to respond_to :capacity }
  it { is_expected.to respond_to(:override_capacity).with(1).argument }

  it "confirms landed planes" do
    allow(plane).to receive(:land).and_return "landed"
    expect(subject.land_plane(plane)).to eq [plane]
  end

  it "clears a plane to take off" do
    subject.landed_planes << plane
    allow(plane).to receive(:take_off).and_return "airborn"
    expect(subject.clear_plane(plane)).to eq []
  end

  it "allows the sys_admin to set a new default capacity" do
    expect(subject.override_capacity(21)).to eq 21
  end

  it "returns an error if a plane tries to land when the airport is at capacity" do

  end

end
