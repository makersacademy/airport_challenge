require 'airport'

RSpec.describe Airport do
  let (:plane) { double :plane, location: "sky" }
  let (:weather) { double :weather }
  let (:airport) {described_class.new(20, weather) }
  describe "#land" do
    context "when not stormy" do
      before do 
        allow(weather).to receive(:generate).and_return(2)
        allow(plane).to receive(:land)
      end

      it "instructs a plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end
  
      it "should raise an error when full" do
        airport.capacity.times { airport.land(plane) }
        expect{ airport.land(plane) }.to raise_error "Airport full"
      end

      it "should raise an error when landing an already landed plane" do
        airport.land(plane)
        allow(plane).to receive(:location).and_return("airport")
        expect{ airport.land(plane) }.to raise_error "Plane already landed"
      end

    end

    context "when stormy" do
      before { allow(weather).to receive(:generate).and_return(5) }
      it "should raise an error when landing" do
        expect { airport.land(plane) }.to raise_error "Cannot land due to bad weather"
      end
    end
  end

  describe "#take_off" do
    context "when not stormy" do
      before do
        allow(weather).to receive(:generate).and_return(2)
        allow(plane).to receive(:land)
      end

      it "instructs a plane to take off" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end

      it "should check the plane is gone" do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include(plane)
      end

      let (:airport2) { Airport.new(20, weather) }
      it "only planes in the airport can take off" do
        airport.land(plane)
        expect{ airport2.take_off(plane) }.to raise_error "Plane not in airport"
      end
    end

    context "when stormy" do
      before { allow(weather).to receive(:generate).and_return(5) }
      it "should raise an error when taking off" do
        expect { airport.take_off(plane) }.to raise_error "Cannot take off due to bad weather"
      end
    end

  end

  describe "capacity" do
    before  do
      allow(weather).to receive(:generate).and_return(2)
      allow(plane).to receive(:land)
    end

    it "has a default capacity" do

      (Airport::DEFUALT_CAPACITY).times { airport.land(plane) }
      expect{ airport.land(plane) }.to raise_error "Airport full"
    end

    context "when user supplies a number" do
    subject {Airport.new(40, weather)}
      it "has a variable capacity" do
        (subject.capacity).times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error "Airport full"
      end
    end
  end
end