require 'airport'

describe Airport do
  subject { Airport.new }
  let(:plane) { double(:plane) }

  it { is_expected.to be_an_instance_of(Airport) }

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "should store a landed plane at the airport" do
      allow(subject).to receive_message_chain(:weather, :stormy?) { false }
      subject.land(plane)
      expect(subject.planes.first).to eq(plane)
    end

    it "should raise error if plane already in airport" do
      allow(subject).to receive_message_chain(:weather, :stormy?) { false }
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("plane already in airport")
    end

    it "should raise error if stormy & #land is called" do
      allow(subject).to receive_message_chain(:weather, :stormy?) { true }
      expect { subject.land(plane) }.to raise_error("the weather is stormy")
    end

    it "should raise error when full & #land called" do
      allow(subject).to receive_message_chain(:weather, :stormy?) { false }
      20.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error("the airport is full")
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "should raise error if plane not in airport" do
      expect { subject.take_off(plane) }.to raise_error("plane not in airport")
    end

    it "should raise error when stormy and #take_off is called " do
      allow(subject).to receive_message_chain(:weather, :stormy?) { false }
      subject.land(plane)
      allow(subject).to receive_message_chain(:weather, :stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error("the weather is stormy")
    end
  end

  describe "#planes" do
    it "#planes should return an array" do
      expect(subject.planes).to be_an_instance_of(Array)
    end

    it "#take_off should remove the plane from the airport" do
      allow(subject).to receive_message_chain(:weather, :stormy?) { false }
      subject.land(plane)
      allow(subject).to receive_message_chain(:weather, :stormy?) { false }
      subject.take_off(plane)
      expect(subject.planes).to eq([])
    end
  end

  describe "#weather" do
    it { is_expected.to respond_to(:weather) }
  end

  describe "#capacity" do
    it "expects default capacity to be 20" do
      expect(Airport::DEFAULT_CAPACITY).to eq(20)
    end

    it "should have a capacity of 50" do
      airport = Airport.new(50)
      expect(airport.capacity).to eq(50)
    end
  end
end
