require "airport.rb"

describe Airport do

  it "responds to .landing" do
    expect(subject).to respond_to(:landing)
  end

  it "landing responds to 1 argument" do
    expect(subject).to respond_to(:landing).with(1).argument
  end

  it "lets a plane land at the airport" do
    plane = subject.landing(Plane.new)
    expect(subject.planes).to eq plane
  end

  it "allows a plane to take-off, and confirm it is no longer in the airport" do
    plane = Plane.new
    subject.take_off(plane)
    expect(plane.in_the_sky?).to eq true
  end

end
