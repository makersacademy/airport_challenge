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
    allow(subject).to receive(:stormy?).and_return false
    expect(subject.land_plane(plane)).to eq [plane]
  end

  it "clears a plane to take off" do
    subject.landed_planes << plane
    allow(subject).to receive(:stormy?).and_return false
    allow(plane).to receive(:take_off).and_return "airborn"
    expect(subject.clear_plane(plane)).to eq []
  end

  it "allows the sys_admin to set a new default capacity" do
    expect(subject.override_capacity(21)).to eq 21
  end

  it "returns an error if a plane tries to land when the airport is at capacity" do
    allow(plane).to receive(:land).and_return "landed"
    allow(subject).to receive(:stormy?).and_return false
    20.times { subject.land_plane(plane) }
    expect { subject.land_plane(plane) }.to raise_error "Maintain holding pattern -> Airport at Capacity"
  end

  it "returns an error if a plane tries to land when the weather is stormy" do
    allow(plane).to receive(:land).and_return "landed"
    subject.instance_variable_set("@weather", 0)
    expect { subject.land_plane(plane) }.to raise_error "Maintain holding pattern -> Stormy Weather"
  end

end
