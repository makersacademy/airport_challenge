require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }

  it "land a plane in an airport" do
    airport = Airport.new
    expect(subject.land(airport)).to eq airport
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "take off from airport" do
    airport = Airport.new
    expect(subject.take_off(airport)).to eq "Plane is no longer in the #{airport}"
  end
end
