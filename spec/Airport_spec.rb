require "Airport"

describe Airport do
  let(:plane) { double(:plane) }
  before(:each) do
    allow(subject.sky).to receive(:stormy?).and_return(false)
  end
  it "can land a plane" do
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it "can let a plane takeoff" do
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes).to_not include plane
  end

  it "won't land a plane if at capacity" do
    Airport::CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error "Airport is full."
  end

  it "won't allow takeoff if weather is stormy" do
    allow(subject.sky).to receive(:stormy?).and_return(true)
    expect { subject.takeoff(plane) }.to raise_error "The sky is too stormy to fly."
  end
end
