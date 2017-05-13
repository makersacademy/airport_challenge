require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to :landed_planes }
  it { is_expected.to respond_to(:clear_plane).with(1).argument }

  it "confirms landed planes" do
    allow(plane).to receive(:land).and_return "landed"
    expect(subject.land_plane(plane)).to eq [plane]
  end

  it "clears a plane to take off" do
    allow(plane).to receive(:take_off).and_return "airborn"
    expect(subject.clear_plane(plane)).to eq []
  end

end
