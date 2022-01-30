require_relative "../lib/airport"
require_relative "../lib/weather"
require_relative "../lib/plane"
describe Airport do
# Landing
  it { is_expected.to respond_to :land }
  it "responds to landing a plane with 1 argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "responds to landing a plane at the airport" do
    plane = Plane.new
    allow(subject).to receive(:weatherbad?).and_return (false)
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end
  it { is_expected.to respond_to :takeoff }

# Taking off
  it "Confirm that a plane is no longer in the airport after take off - land 2 planes and take off 1" do
    allow(subject).to receive(:weatherbad?).and_return (false)
    2.times { subject.land(Plane.new) }
    subject.takeoff
    expect(subject.planes.length).to be 1
  end

  it "Confirm that a plane is no longer in the airport after take off - land 1 plane and then take it off" do
    allow(subject).to receive(:weatherbad?).and_return (false)
    subject.land(Plane.new)
    allow(subject).to receive(:weatherbad?).and_return (false)
    subject.takeoff
    expect(subject.planes).to be_empty
  end

# Responds to stormy weather
  it "Prevents a plane landing when the airport is full" do
    allow(subject).to receive(:weatherbad?).and_return (false)
    20.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error("Airport is full")
  end

  it "Prevents a plane taking off if the airport is empty" do
    expect { subject.takeoff }.to raise_error("Airport is empty")
  end

# Respond to capacity changes
  it "Returns the DEFAULT capacity" do
    # expect(subject.capacity).to eq Airport::CAPACITY
    expect(subject.capacity).to eq 20
  end

  it "Allow DEFAULT capcity to be overwritten with 100" do
    airport = Airport.new(100)
    expect(airport.capacity).to eq 100
  end

# Respond to stormy weather
  it "Prevent take off when the weather is stormy" do
    allow(subject).to receive(:weatherbad?).and_return (false)
    subject.land(Plane.new)
    allow(subject).to receive(:weatherbad?).and_return (true)
    expect { subject.takeoff }.to raise_error("Weather is too stormy for take off")
  end

  it "Prevent landing when the weather is stormy" do
    plane = Plane.new
    allow(subject).to receive(:weatherbad?).and_return (true)
    expect { subject.land(plane) }.to raise_error("Weather is too stormy for landing")
  end

# Plane Status ie flying or not
  it "Expect plane to have a status of flying after take off" do
    allow(subject).to receive(:weatherbad?).and_return (false)
    subject.land(Plane.new)
    plane = subject.takeoff
    expect(plane.in_flight).to eq true
  end

  it "Expect plane to have a status of NOT flying after landing" do
    allow(subject).to receive(:weatherbad?).and_return (false)
    plane = Plane.new
    subject.land(plane)
    expect(plane.in_flight).to eq false
  end
end
