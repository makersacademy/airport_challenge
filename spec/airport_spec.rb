require 'airport'

describe Airport do

  it "Can land a plane" do
    expect(subject).to respond_to(:land)
  end

  it "Can let a plane take off" do
    expect(subject).to respond_to(:takeoff)
  end

  it "Prevents takeoff if weather is stormy" do
    allow(subject.weather).to receive(:stormy?) { true }
    expect { subject.takeoff }.to raise_error "Can't take off in stormy weather"
  end

  it "Prevents landing if weather is stormy" do
    allow(subject.weather).to receive(:stormy?) { true }
    expect { subject.land(Plane.new) }.to raise_error "Can't land in stormy weather"
  end

  it "can be full" do
    expect(subject).to respond_to(:full?)
  end

  it "Prevents landing when airport is full" do
    allow(subject.weather).to receive(:stormy?) { false }
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error "Airport full, can't land"
  end

end
