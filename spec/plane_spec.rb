require 'plane'

describe Plane do

  let(:airport) { double(:airport) }

  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :land }

  it "shows a plane as airborn before being landed" do
    expect(subject.landed?).to eq "airborn"
  end

  it "shows a plane landed after being instructed to" do
    allow(airport).to receive(:land_plane).and_return "landed"
    subject.land
    expect(subject.landed?).to eq "landed"
  end
end
