require 'airport'

describe Airport do
  it { expect(subject).to respond_to(:confirm_landing).with(2).argument }
  it { expect(subject).to respond_to(:confirm_takeoff).with(1).argument }
  describe "#initialize" do
    it "creates new empty airport" do
      expect(subject.apron.count).to eq(0)
    end

    it "sets default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe "#confirm_landing" do
    it "raises weather error" do
      weather = double("weather", :condition => 50)
      plane = double("plane", :landed => false)
      expect{subject.confirm_landing(weather, plane)}.to raise_error("too stormy to land")
    end

    it "raises full error" do
      plane = double("plane", :landed => false)
      described_class::DEFAULT_CAPACITY.times{subject.apron << plane }
      weather = double("weather", :condition => 99)
      expect{subject.confirm_landing(weather, plane)}.to raise_error("airport full")
    end

    it "adds plane to apron" do
      weather = double("weather", :condition => 99)
      plane = double("plane", :flight => true, :landed => false)
      expect{subject.confirm_landing(weather, plane)}.to change{subject.apron.count}.by(1)
    end
  end

  describe "#confirm_takeoff" do
    it "raises weather error" do
      weather = double("weather", :condition => 50)
      plane = double("plane", :landed => false)
      subject.apron << plane
      expect{subject.confirm_takeoff(weather)}.to raise_error("too stormy to take off")
    end

    it "removes plane from apron" do
      weather = double("weather", :condition => 99)
      plane = double("plane", :takeoff => true)
      subject.apron << plane
      expect{subject.confirm_takeoff(weather)}.to change{subject.apron.count}.by(-1)
    end
  end
end
