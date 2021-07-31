require 'airport'

describe Airport do

  it { is_expected.to be_a Airport }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "has a hangar array to store planes" do
    expect(subject.hangar).to be_a Array
  end

  it "stores a plane in hangar after landing" do 
    subject.land(double :plane)
    expect(subject.hangar.size).to eq 1
  end

  it "can confirm a plane is at the airport" do
    plane = double :plane
    subject.land(plane)
    expect(subject.contains?(plane)).to be true
  end

  it "can confirm a plane, after taking off, is no longer at the airport" do
    allow(subject.weather).to receive(:stormy?) { false }
    plane = double :plane
    subject.hangar << plane
    subject.take_off(plane)
    expect(subject.contains?(plane)).to be false
  end

  it "can accept default capacity number of planes" do
    subject.capacity.times { subject.land(double :plane) }
    expect(subject.hangar.size).to eq subject.capacity
  end

  it "prevents landing when the airport is full" do
    subject.capacity.times { subject.land(double :plane) }
    expect { subject.land(double :plane) }.to raise_error "Landing not permitted: airport full!"
  end

  it "allows landing if a space becomes available" do
    allow(subject.weather).to receive(:stormy?) { false }
    subject.capacity.times { subject.land(double :plane) }
    subject.take_off(subject.hangar.last)
    expect { subject.land(double :plane) }.not_to raise_error
  end

  it "can tell user the airport capacity and confirm default capacity" do
    expect(subject.capacity).to eq 10
  end

  it "allows user to set custom capacity when instantiating new airport object" do
    expect(Airport.new(100).capacity).to eq 100
  end

  it "accepts only positive integers as capacity" do
    [0, -3, "1", 4.5, true, Array.new].each do |bad_capacity|
      expect { Airport.new(bad_capacity) }.to raise_error "Airport capacity must be a positive integer"
    end
  end

  it "prevents take off if weather is stormy" do
    allow(subject.weather).to receive(:stormy?) { true }
    expect { subject.take_off(double :plane) }.to raise_error "Take off not permitted when weather is stormy"
  end

end
