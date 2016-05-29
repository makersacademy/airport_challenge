require 'airport.rb'

describe Plane do
  let (:airport) {Airport.new}
  let (:weather) {Weather.new}
  let (:plane) {Plane.new}

  it "has a default capacity" do
    expect(subject.capacity).to eq Plane::DEFAULT_CAPACITY
  end
  it "allows user to change capacity" do
    subject.capacity = 300
    expect(subject.capacity).to eq 300
  end
  it "responds to #flying?" do
    expect(subject.flying?).to be true
  end

  it "responds to #arrival" do
    expect(subject.arrival).to be false
  end

  it "has an unknown origin" do
    expect(subject.origin).to be_nil
  end

  it "allows to change origin" do
    subject.origin = "LHR"
    expect(subject.origin).to eq "LHR"
  end

  it "has an unknown destination" do
    expect(subject.destination).to be_nil
  end

  it "allows us to change destination" do
    subject.destination = "MAD"
    expect(subject.destination).to eq "MAD"
  end

  it "is not flying at arrival" do
    allow(airport).to receive(:stormy?).and_return(false)
    allow(airport).to receive(:full?).and_return(false)
    airport.land(plane)
    expect(plane.flying?).to be false
  end

  it "is flying when taken off" do
    allow(airport).to receive(:stormy?).and_return(false)
    allow(airport).to receive(:full?).and_return(false)
    airport.land(plane)
    expect(plane.flying?).to be false
    airport.take_off(plane)
    expect(plane.flying?).to be true
  end

end
