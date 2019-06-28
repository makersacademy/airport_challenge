require 'plane'

describe Plane do
  let(:airport) { double :airport }
  it "lands at an airport" do
    allow(airport).to receive(:name).and_return("Test")
    allow(airport).to receive(:receive)
    expect(subject.land_at(airport)).to eq "Test"
  end

  it "takes off from an airport" do
    allow(airport).to receive(:send)
    expect(subject.take_off_from(airport)).to eq "airborne"
  end
end
