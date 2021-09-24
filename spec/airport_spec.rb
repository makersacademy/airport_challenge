require 'airport'
require 'plane'

describe Airport do

  it "can have planes land here" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it "can have planes take off when weather is fine" do
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:weather) { "sunny" }
    expect(subject.takeoff).to be_a(Plane)
  end

  it "does not accept planes when the airport is full" do
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error("Airport is full")
  end

  it "does not allow take off when the weather is stormy" do
    allow(subject).to receive(:weather) {"stormy"}
    expect { subject.takeoff }.to raise_error "Weather is stormy. Takeoff not permitted."
  end
end
