require 'plane'

describe Plane do

  let (:airport) { double(:airport) }

  it { is_expected.to respond_to :landed? }

  it "shows a plane as airborn before being landed" do
    expect(subject.landed?).to eq false
  end

  it "shows a plane landed after being instructed to" do
    allow(airport).to receive(:land_plane).and_return true
    expect(subject.landed?).to eq true
  end
end
