require 'airport'

describe Airport do
  let(:weather) { double :weather, stormy?: false }
  let(:plane) { instance_double Plane, :flying => true }
  subject { Airport.new weather }

  it { expect(subject).to respond_to(:land).with(1).argument }

  it "Instructs a plane to land" do
    allow(plane).to receive(:land)
    expect(subject.land(plane)).to eq("Plane has landed.")
  end

  it "Won't land a plane that has already landed" do
    allow(plane).to receive(:flying).and_return(false)
    expect { subject.land(plane) }.to raise_error("Plane has aleady landed.")
  end

  it { expect(subject).to respond_to(:takeoff).with(1).argument }

  it "Instructs a plane to take off" do
    allow(plane).to receive(:takeoff)
    allow(plane).to receive(:flying).and_return(false)
    expect(subject.takeoff(plane)).to eq("Plane has taken off.")
  end

  it "won't instruct a plane to take off if it is already flying" do
    expect { subject.takeoff(plane) }.to raise_error("Plane is already flying.")
  end

  it "prevents takeoff when the weather is stromy" do
    allow(plane).to receive(:flying).and_return(false)
    allow(weather).to receive(:stormy?).and_return(true)
    expect { subject.takeoff(plane) }.to raise_error("Too stormy for takeoff.")
  end

  it "prevents landing when the weather is stromy" do
    allow(plane).to receive(:land)
    allow(weather).to receive(:stormy?).and_return(true)
    expect { subject.land(plane) }.to raise_error("Too stormy for landing.")
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "prevents a landing when the airport is full" do
    allow(plane).to receive(:land)
    (1...Airport::DEFAULT_CAPACITY).each do subject.land(plane) end
    expect { subject.land(plane) }.to raise_error("Airport is at capacity.")
  end

end
