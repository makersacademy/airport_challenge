require 'airport_challenge'
require 'plane'

describe Airport do
  it "receives a landing plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it "a plane takes off and is gone from airport" do
    plane = Plane.new
    subject.land(plane)
    planes = subject.contents.length
    subject.takeoff(plane)
    expect(planes - 1).to eq subject.contents.length
    expect(subject.contents).not_to include plane
  end
end

#subject.dock(bike)
