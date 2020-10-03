require "Airport"

describe Airport do
  let(:plane) { double(:plane, :flying? => true) }
  before(:each) do
    allow(subject.sky).to receive(:stormy?).and_return(false)
  end
  it "can land a plane" do
    expect(plane).to receive(:land) { subject }
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it "can let a plane takeoff" do
    expect(plane).to receive(:land) { subject }
    expect(plane).to receive(:takeoff)
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes).to_not include plane
  end

  it "won't land a plane if at capacity" do
    expect(plane).to receive(:land) { subject }.exactly(Airport::CAPACITY).times
    Airport::CAPACITY.times { subject.land(plane.clone) }
    expect { subject.land(plane.clone) }.to raise_error "Airport is full."
  end

  it "won't allow takeoff if weather is stormy" do
    allow(subject.sky).to receive(:stormy?).and_return(true)
    expect { subject.takeoff(plane) }.to raise_error "The sky is too stormy to fly."
  end

  it "won't allow landing if weather is stormy" do
    allow(subject.sky).to receive(:stormy?).and_return(true)
    expect { subject.land(plane) }.to raise_error "The sky is too stormy to land."
  end

  it "won't allow a plane to take off if it's not in an airport" do
    expect { subject.takeoff(plane) }.to raise_error "The plane couldn't take off because it is not at the airport."
  end

  it "won't allow a plane to take off it it's in a different airport" do
    different_airport = Airport.new
    expect(plane).to receive(:land) { different_airport }
    different_airport.land(plane)
    expect { subject.takeoff(plane) }.to raise_error "The plane couldn't take off because it is not at the airport."
  end

  it "won't allow a plane to land if it's not flying" do
    allow(plane).to receive(:flying?).and_return(false)
    expect { subject.land(plane) }.to raise_error "The plane cannot land as it's not in the air."
  end
end
