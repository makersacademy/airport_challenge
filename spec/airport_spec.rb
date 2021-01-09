require 'airport_challenge'
require 'plane'

describe Airport do
  it "receives a landing plane" do
    plane = Plane.new
    allow(subject).to receive(:stormy) { false }
    expect(subject.land(plane)[0]).to eq plane
  end

  it "plane takes off and is gone from airport" do
    plane = Plane.new
    subject.planes << plane
    subject.takeoff(plane)
    allow(subject).to receive(:stormy) { false }
    expect(subject.planes).not_to include plane
  end

  it "blocks landing when airport at capacity" do
    plane = Plane.new
    subject.capacity.times { subject.land(plane) }
    allow(subject).to receive(:stormy) { false }
    expect { subject.land(plane) }.to raise_error("This airport is full.")
  end

  it "prevents takeoff when weather is stormy" do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { true }
    expect { subject.takeoff(plane) }.to raise_error("Too stormy for takeoff.")
  end

  it "prevents landing when weather is stormy" do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land(plane) }.to raise_error("Too stormy to land.")
  end
end
