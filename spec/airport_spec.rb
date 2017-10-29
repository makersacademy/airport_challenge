require 'airport'
require 'plane'

describe Airport do
  subject { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { double( :weather => "stormy") }

    it { is_expected.to be_an_instance_of(Airport) }

  describe "#land" do

    it{ is_expected.to respond_to(:land).with(1).argument }

    it "should store a landed plane at the airport" do
      subject.land(plane)
      expect(subject.planes.first).to eq(plane)
    end

    it "should raise error if plane already in airport" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("plane already in airport")
    end

    it "should raise error if stormy & #land is called" do
      airport = Airport.new(20, weather.weather)
      expect { airport.land(plane) }.to raise_error("the weather is stormy")
    end

    it "should raise error when full & #land called" do
      20.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error("the airport is full")
    end
  end

  describe "#take_off" do
    it "should respond to #take_off with 1 argument" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "should raise error if plane not in airport" do
      expect { subject.take_off(plane) }.to raise_error("plane not in airport")
    end

    it "should raise error when stormy and #take_off is called " do
      subject.land(plane)
      subject.new_day(weather.weather)
      expect { subject.take_off(plane) }.to raise_error("the weather is stormy")
    end
  end

  describe "#planes" do
    it "#planes should return an array" do
      expect(subject.planes).to be_an_instance_of(Array)
    end

    it "#take_off should remove the plane from the airport" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq([])
    end
  end

  describe "#new_day" do
    it "changes weather" do
      expect(subject.new_day).to eq("stormy").or eq("sunny")
    end
  end

  describe "#weather" do
    it "responds to #weather" do
      expect(subject).to respond_to(:weather)
    end
  end

  describe "#capacity" do
    it "expects default capacity to be 20" do
      expect(Airport::DEFAULT_CAPACITY).to eq(20)
    end

    it "should have a capacity of 20" do
      airport = Airport.new(50)
      expect(airport.capacity).to eq(50)
    end
  end
end
