require 'airport_challenge'
require 'plane'

describe Airport do
  it "receives a landing plane" do
    plane = Plane.new
    expect(subject.land(plane)[0]).to eq plane
  end

  it "a plane takes off and is gone from airport" do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes).not_to include plane
  end
end
