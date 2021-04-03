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
    expect(subject.takeoff(plane)).to eq "#{plane} is in the clouds"
  end

  it "prevents landing when airport is full" do
    20.times { subject.land(Plane.new) }
    expect {subject.land(Plane.new)}.to raise_error "Sorry, Airport packed over capacity"
  end

end
