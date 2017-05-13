require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to :landed_planes }

  it "shows a plane landed after being instructed to" do
    allow(plane).to receive(:land).and_return "landed"
    expect(subject.land_plane(plane)).to eq [plane]
  end

end
