require "airport.rb"
RSpec.describe Airport do
  before(:each) do 
    allow(Weather).to receive(:stormy?) { false }
  end
  describe 'initialization' do
    subject { Airport.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(Plane.new)
      end
      expect { subject.land Plane.new }.to raise_error("Airport is full")
    end
    it 'has a variable capacity' do
      airport = Airport.new(50)
      50.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error("Airport is full")
    end
  end
  describe "land method" do
    context "exists" do
      it { is_expected.to respond_to(:land) }
    end
    context "can take one argument" do
      it { is_expected.to respond_to(:land).with(1).argument }
    end
    context "takes plane as argument" do
      it "and returns plane" do
        plane = Plane.new
        expect(subject.land(plane)).to include(plane)
      end
    end
    context "returns error" do
      it "if plane is already landed and in planes array" do
        plane = Plane.new
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error("Plane has already landed at airport")
      end
    end
    context "when weather is stormy?" do
      it "and expects error to be raised" do
        plane = Plane.new
        allow(subject).to receive(:stormy?).and_return(true)
        expect { subject.land(plane) }.to raise_error("Weather is stormy, cannot land")
      end
    end
    context "Capacity" do
      it 'has a default capacity' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end
      it 'raises an error when full' do
        subject.capacity.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error("Airport is full")
      end
    end
  end
  describe "planes method" do
    context "exists" do
      it { is_expected.to respond_to(:planes) }
    end
    context "after #plane has been landed" do
      it "to return landed plane" do
        plane = Plane.new
        subject.land(plane)
        expect(subject.planes).to include(plane)
      end
    end
    context "should return" do
      it "an array" do
        expect(subject.planes).to be_a(Array)
      end
    end
  end
  describe "take_off method" do
    context "exists" do
      it { is_expected.to respond_to(:take_off) }
    end
    context "can take one argument" do
      it { is_expected.to respond_to(:take_off).with(1).argument }
    end
    context "removes #plane from plane attribute" do
      it "and returns nil" do
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include(plane)
      end
    end
    context "returns error" do
      it "if plane is not in planes array" do
        plane = Plane.new
        expect { subject.take_off(plane) }.to raise_error("Plane not at airport, cannot take off")
      end
    end
    context "when weather is stormy?" do
      it "and expects error to be raised" do
        plane = Plane.new
        subject.land(plane)
        allow(subject).to receive(:stormy?).and_return(true)
        expect { subject.take_off(plane) }.to raise_error("Weather is stormy, cannot take off")
      end
    end
  end
end
