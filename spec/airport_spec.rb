require 'airport_challenge'
require 'plane'

describe Airport do
  it "receives a landing plane" do
    plane = Plane.new
    expect(subject.land(plane)[0]).to eq plane
  end

  it "plane takes off and is gone from airport" do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes).not_to include plane
  end

  it "blocks landing when airport at capacity" do
    plane = Plane.new
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error("This airport is full.")
  end

  it "prevents takeoff when weather is stormy" do
    plane = Plane.new
    weather = "stormy"
    expect { subject.takeoff(plane, weather) }.to raise_error("Too stormy for takeoff.")
  end

  it "prevents landing when weather is stormy" do
    plane = Plane.new
    weather = "stormy"
    expect { subject.land(plane, weather) }.to raise_error("Too stormy to land.")
  end
end
