require 'airport'

describe Airport do
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
    allow(subject).to receive(:stormy?) { false }
    expect(subject).to respond_to(:take_off)
  end

  it "can store plane" do
    allow(subject).to receive(:stormy?) { false }
    expect(subject.land(Plane.new)).to eq subject.planes
  end

  it "can confirm plane has left" do
    allow(subject).to receive(:stormy?) { false }
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
    allow(subject).to receive(:stormy?) { false }
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
  # it "#stormy is false most of the time" do
  #   10.times {expect(subject.stormy?).not_to eql(subject.stormy?)}
  # end



end
