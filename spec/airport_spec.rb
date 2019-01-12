require 'airport'

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
    subject.land(Plane.new)
    expect(subject.take_off).to eq []
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  it "responds to #stormy? check" do
    expect(subject).to respond_to(:stormy?)
  end

  it "prevents take off when stormy" do
    subject.land(Plane.new)
    allow(subject).to receive(:stormy?) { true }
    expect { subject.take_off } .to raise_error "stormy can't take off"
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
  it "prevents landing when stormy" do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land(Plane.new) } .to raise_error "stormy can't land"
  end

  #test implementation of random weather
  it "#stormy is false most of the time" do
    10.times {expect(subject.stormy?).to eq (subject.stormy?)}
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




end
