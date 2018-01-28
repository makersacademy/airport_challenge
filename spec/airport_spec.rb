require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it "lands a plane" do
    plane = double(Object.new)
    allow(subject).to receive(:stormy_weather?) { false }
    subject.land(plane)
    expect(plane).to eq subject.planes[0]
  end
  it { is_expected.to respond_to(:take_off) }
  it "lets one plane land and take off" do
    plane = double(Object.new)
    allow(subject).to receive(:stormy_weather?) { false }
    subject.land(plane)
    subject.take_off
    expect(subject.planes).to eq []
  end
  context "stormy weather" do
    let(:airport) { Airport.new }
    let(:plane) { double(Object.new) }
    it "should not let a plane land when weather is stormy" do
      allow(airport).to receive(:stormy_weather?) { true }
      expect { airport.land(plane) }.to raise_error("It is too stormy to land")
    end
  end
  context "plane is landed and weather is stormy" do
    let(:airport) { Airport.new }
    let(:plane) { double(Object.new) }
    it "should not let a plane take off when weather is stormy" do
      allow(airport).to receive(:stormy_weather?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy_weather?) { true }
      expect { airport.take_off }.to raise_error("It is too stormy to take off")
    end
  end
  context "Plane is landed weather is not stormy" do
    let(:airport) { Airport.new }
    let(:plane) { double(Object.new) }
    it "should let a plane take off when weather is not stormy" do
      allow(airport).to receive(:stormy_weather?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy_weather?) { false }
      airport.take_off
      expect(airport.plane).to eq nil
    end
  end
  context "Airport is full." do
    let(:airport) { Airport.new(1) }
    let(:plane) { double(Object.new) }
    let(:plane2) { double(Object.new) }
    it "Should not land when airport is full" do
      allow(airport).to receive(:stormy_weather?) { false }
      airport.land(plane)
      expect { airport.land(plane2) }.to raise_error("Airport is full")
    end
  end
  it "has a default capacity" do
    expect(subject.capacity).to eq 10
  end
  context "#initialize" do
    let(:airport) { Airport.new(15) }
    it "Default capacity can be changed when airport is made" do
      expect(airport.capacity).to eq 15
    end
  end
  context "After DEFAULT_CAPACITY has been set" do
    let(:airport) { Airport.new }
    it "lets capacity be altered post creation" do
      airport.capacity = 5
      expect(airport.capacity).to eq 5
    end
  end
  context "landed planes added to the planes array" do
    let(:plane) { double(Object.new) }
    let(:plane2) { double(Object.new) }
    it "lets multiple planes land" do
      allow(subject).to receive(:stormy_weather?) { false }
      subject.land(plane)
      subject.land(plane2)
    end
  end
  context "a plane should has already landed" do
    let(:plane) { double(Object.new) }
    it "shouldn't land more then once" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("This plane has already landed")
    end
  end

end
