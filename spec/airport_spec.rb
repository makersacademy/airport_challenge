require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  it "can have planes land" do
    allow(subject).to receive(:weather) {"sunny"}
    plane.grounded = false
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it "can have a plane land if it is not already grounded" do
    allow(subject).to receive(:weather) {"sunny"}
    plane.grounded = false
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it "can have planes take off when weather is fine" do
    allow(subject).to receive(:weather) {"sunny"}
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes).not_to include(plane)
  end

  it "does not accept planes when the airport is full" do
    allow(subject).to receive(:weather) {"sunny"}
    subject.capacity.times { subject.land(Plane.new(false)) }
    expect { subject.land(plane) }.to raise_error("Airport is full")
  end

  it "does not allow take off when the weather is stormy" do
    allow(subject).to receive(:weather) {"stormy"}
    expect { subject.takeoff(plane) }.to raise_error "Weather is stormy. Takeoff not permitted."
  end

  it "does not allow planes to land when weather is stormy" do
    plane = plane
    allow(subject).to receive(:weather) {"stormy"}
    expect { subject.land(plane) }.to raise_error "Weather is stormy. Landing not permitted."
  end
end
