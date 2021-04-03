require 'airport'
require 'plane'

describe Airport do

  it "instructs a plane to land at an airport" do
    expect(subject).to respond_to(:land)
  end

  it "instructs plane to take off from an airport" do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it "confirm a plane is no longer in the airport" do
     plane = Plane.new
     subject.land(plane)
    expect(subject.takeoff(plane)).to eq "#{plane} has left the runway."
  end

end
