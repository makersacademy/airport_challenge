require 'airport'

describe Airport do
  let(:weather) { double :weather, stormy?: false }
  subject { Airport.new weather }

  it { expect(subject).to respond_to(:land).with(1).argument }

  it "Instructs a plane to land" do
    expect(subject.land(Plane.new)).to eq("Plane has landed.")
  end

  it "Won't land a plane that has already landed" do
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error("Plane has aleady landed.")
  end

  it { expect(subject).to respond_to(:takeoff).with(1).argument }

  it "Instructs a plane to take off" do
    plane = Plane.new
    plane.flying = false
    expect(subject.takeoff(plane)).to eq("Plane has taken off.")
  end

  it "won't instruct a plane to take off if it is already flying" do
    plane = Plane.new
    plane.flying = false
    subject.takeoff(plane)
    expect { subject.takeoff(plane) }.to raise_error("Plane is already flying.")
  end

  it "prevents takeoff when the weather is stromy" do
    plane = Plane.new
    plane.flying = false
    allow(weather).to receive(:stormy?).and_return(true)
    expect { subject.takeoff(plane) }.to raise_error("Too stormy for takeoff.")
  end

end
