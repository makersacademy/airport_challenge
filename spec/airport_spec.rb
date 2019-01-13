require 'airport'
require 'plane'

describe Airport do

  before :each do
    allow(subject).to receive(:stormy?) { false }
  end

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it "can instruct plane to land" do
    expect(subject).to respond_to(:land).with(1)
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it "can instruct plane to take off" do
    expect(subject).to respond_to(:take_off)
  end

  it "can store plane" do
    expect(subject.land(Plane.new)).to eq subject.planes
  end

  it "can confirm plane has left" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).to eq []
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  it "responds to #stormy? check" do
    expect(subject).to respond_to(:stormy?)
  end

  it "prevents take off when stormy" do
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:stormy?) { true }
    expect { subject.take_off(plane) } .to raise_error "stormy can't take off"
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
  it "prevents landing when stormy" do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land(Plane.new) } .to raise_error "stormy can't land"
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  it "prevents landing when airport is full" do
    subject.capacity.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) } .to raise_error "airport full"
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  it "has default capacity of 10" do
    expect(subject.capacity).to eq(10)
  end

  it "allows capacity to be set" do
    airport_test = Airport.new(20)
    expect(airport_test.capacity).to eq(20)
  end

  # EDGE CASE #1 - planes can only take off from airport they're in
  it "#take_off can take argument to define which plane" do
    expect(subject).to respond_to(:take_off).with(1)
  end

  it "can specify which plane takes off" do
    airport_test = Airport.new
    boeing = Plane.new
    airbus = Plane.new
    allow(airport_test).to receive(:stormy?) { false }
    airport_test.land(boeing)
    airport_test.land(airbus)
    expect(airport_test.take_off(boeing)).to eq boeing
  end

  # planes that are already flying cannot takes off
  it "prevents take off if plane already flying" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect { subject.take_off(plane) } .to raise_error "already flying"
  end

  # planes that are already flying cannot be in an airport
  it "prevents flying planes from being in an airport" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes.delete(plane)).to eq nil
  end

  # planes that are landed cannot land again and must be in an airport
  it "prevents landing of plane if already landed" do
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) } .to raise_error "already landed"
  end

end

describe '#stormy?' do
  it "#stormy is false most of the time" do
    a, b = [], []
    airport = Airport.new
    100.times { a << airport.stormy? }
    100.times { b << airport.stormy? }
    expect(a).not_to eq(b)
  end
end
