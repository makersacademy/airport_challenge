require 'airport'

RSpec.describe Airport do
  let (:plane) {double :plane}
  describe "#land" do
    context "when not stormy" do
      before do 
        allow(subject).to receive(:stormy?).and_return false
        allow(plane).to receive(:location).and_return("sky")
        allow(plane).to receive(:land)
      end

      it "instructs a plane to land" do
        expect(subject).to respond_to(:land).with(1).argument
      end
  
      it "should raise an error when full" do
        subject.capacity.times { subject.land(plane) }
        expect{ subject.land(plane) }.to raise_error "Airport full"
      end

      it "should raise an error when landing an already landed plane" do
        subject.land(plane)
        allow(plane).to receive(:location).and_return("airport")
        expect{ subject.land(plane) }.to raise_error "Plane already landed"
      end

    end

    context "when stormy" do
      before {allow(subject).to receive(:stormy?).and_return true }
      it "should raise an error when landing" do
        expect { subject.land(plane) }.to raise_error "Cannot land due to bad weather"
      end
    end
  end

  describe "#take_off" do
    context "when not stormy" do
      before do
        allow(subject).to receive(:stormy?).and_return false
        allow(plane).to receive(:location).and_return("sky")
        allow(plane).to receive(:land)
      end

      it "instructs a plane to take off" do
        expect(subject).to respond_to(:take_off).with(1).argument
      end

      it "should check the plane is gone" do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include(plane)
      end

      let (:airport2) {Airport.new}
      it "only planes in the airport can take off" do
        allow(plane).to receive(:location).and_return("sky")
        allow(plane).to receive(:land)
        subject.land(plane)
        allow(airport2).to receive(:stormy?).and_return false
        expect{ airport2.take_off(plane) }.to raise_error "Plane not in airport"
      end
    end

    context "when stormy" do
      before {allow(subject).to receive(:stormy?).and_return true }
      it "should raise an error when taking off" do
        expect { subject.take_off(plane) }.to raise_error "Cannot take off due to bad weather"
      end
    end

  end

  describe "capacity" do
    before  do
      allow(subject).to receive(:stormy?).and_return false 
      allow(plane).to receive(:location).and_return("sky")
      allow(plane).to receive(:land)
    end

    it "has a default capacity" do

      (Airport::DEFUALT_CAPACITY).times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error "Airport full"
    end

    context "when user supplies a number" do
    subject {Airport.new(40)}
      it "has a variable capacity" do
        (subject.capacity).times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error "Airport full"
      end
    end
  end
end