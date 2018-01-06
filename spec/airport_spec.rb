require 'airport'
require 'plane'

describe Airport do
  it "should create a new instance" do
    expect(subject).to be_a Airport
  end

  it "should land at an airport" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.airport).to eq plane
  end

  it "instruct a plane to take off" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.airport).to eq nil
  end

  it "should confirm plane has left the airport" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq "#{plane} no longer in airport."
  end

end
