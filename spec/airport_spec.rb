require 'airport'
require 'plane'

describe Airport do
  subject { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { double :weather }
  let(:airport_2) { double :airport_2 }

  it "should create a new airport" do
    expect(subject).to be_an_instance_of(Airport)
  end

  it "should respond to #land with 1 argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "should respond to #take_off with 1 argument" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "should respond to #planes" do
    expect(subject).to respond_to(:planes)
  end

  it "#planes should return an array" do
    expect(subject.planes).to be_an_instance_of(Array)
  end

  it "should store a landed plane at the airport" do
    subject.land(plane)
    expect(subject.planes.first).to eq(plane)
  end

  it "#take_off should remove the plane from the airport" do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).to eq([])
  end

  it "should respond to #stormy" do
    expect(subject).to respond_to(:stormy)
  end

  it "responds to #change_weather" do
    expect(subject).to respond_to(:change_weather)
  end

  it "changes weather" do
    expect(subject.change_weather).to eq(true).or eq(false)
  end

  describe "Errors" do


    it "should raise error if plane not in airport" do
      expect { subject.take_off(plane) }.to raise_error("plane not in airport")
    end

    it "should raise error if plane already in airport" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("plane already in airport")
    end

    it "should raise error when stormy and #take_off is called " do
      allow(weather).to receive(:stormy?) { true }
      subject.land(plane)
      subject.change_weather(weather.stormy?)
      expect { subject.take_off(plane) }.to raise_error("the weather is stormy")
    end

    it "should raise error if stormy & #land is called" do
      allow(weather).to receive(:stormy?) { true }
      airport = Airport.new(weather.stormy?)
      expect { airport.land(plane) }.to raise_error("the weather is stormy")
    end

  end
end
