require "plane"

describe Plane do
  let(:airport) { double(:receive_plane => true, :release_plane => true) }
  let(:landed_plane) { Plane.new }
  let(:bad_weather) { double(:report => "stormy")}
  let(:good_weather) { double(:report => "good") }
  it { expect(subject).to respond_to(:land).with(1).argument }
  it { expect(subject.land(airport)).to eq("Plane has landed") }
  it "Plane.flying should equal true when the plane has taken off from an airport" do
    subject.land(airport)
    subject.fly
    expect(subject.flying).to eq(true)
  end
end
