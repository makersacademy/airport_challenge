require 'airport'
require 'plane'

describe Airport do

  it "can have planes land here" do
    plane = Plane.new
    allow(subject).to receive(:weather) {"sunny"}
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it "can have planes take off when weather is fine" do
    plane = Plane.new
    allow(subject).to receive(:weather) {"sunny"}
    subject.land(plane)
    expect(subject.takeoff).to be_a(Plane)
  end

  it "does not accept planes when the airport is full" do
    allow(subject).to receive(:weather) {"sunny"}
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error("Airport is full")
  end

  it "does not allow take off when the weather is stormy" do
    allow(subject).to receive(:weather) {"stormy"}
    expect { subject.takeoff }.to raise_error "Weather is stormy. Takeoff not permitted."
  end

  it "does not allow planes to land when weather is stormy" do
    plane = Plane.new
    allow(subject).to receive(:weather) {"stormy"}
    expect { subject.land(plane) }.to raise_error "Weather is stormy. Landing not permitted."
  end
end
