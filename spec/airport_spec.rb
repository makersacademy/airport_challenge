require 'airport'

describe Airport do
  let(:plane) { double :plane }
  let(:subject) { Airport.new }
  
  describe "#land" do
    context "airport is not full" do
      it "lets a plane land at an airport" do
        allow(plane).to receive(:land)
        allow(plane).to receive(:flight_number) { "Flight 1" }
        allow(plane).to receive(:status) { "Flying" }
        expect(Weather).to receive(:rand).and_return(2)
        
        subject.land(plane)
        expect(subject.planes).to include "Flight 1"
      end

      it "doesn't let a plane land if it is already grounded" do
        expect(Weather).to receive(:rand).and_return(2)
        allow(plane).to receive(:status) { "Landed" }
        expect { subject.land(plane) }.to raise_error "This plane has already landed"
      end
    end

    context "airport is full" do
      before(:each) do
        allow(plane).to receive(:land)
      end

      it "prevents plane from landing when airport full to default capacity" do  
        20.times do |x|
          plane = double(:plane)
          allow(plane).to receive(:flight_number) { "Flight #{x}" }
          allow(plane).to receive(:status) { "Flying" }
          allow(plane).to receive(:land)
          expect(Weather).to receive(:rand).and_return(2)
          subject.land(plane)
        end

        twenty_first_plane = double(:twenty_first_plane)
        allow(twenty_first_plane).to receive(:flight_number) { "Flight 21" }
        
        expect { subject.land(plane) }.to raise_error("Airport is full")
        expect(subject.planes).to_not include "Flight 21"
      end

      it "prevents plane from landing when airport is full to a custom capacity" do
        capacity = 10
        
        airport = Airport.new(capacity)
        
        capacity.times do |x|
          plane = double(:plane)
          allow(plane).to receive(:flight_number) { "Flight #{x}" }
          allow(plane).to receive(:status) { "Flying" }
          allow(plane).to receive(:land)
          expect(Weather).to receive(:rand).and_return(2)
          airport.land(plane)
        end

        extra_plane = double(:extra_plane)
        allow(extra_plane).to receive(:flight_number) { "Flight 21" }

        expect { airport.land(extra_plane) }.to raise_error("Airport is full")
        expect(airport.planes).to_not include "Flight 21"
      end
    end

    context "weather is stormy" do
      it "prevents a plane from landing when weather is stormy" do
        expect(Weather).to receive(:rand).and_return(8)
        expect { subject.land(plane) }.to raise_error("Cannot land a plane in stormy weather")
      end
    end
  end

  describe "#take_off" do

    before(:each) do
      allow(plane).to receive(:flight_number) { "Flight 1" }
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      expect(Weather).to receive(:rand).and_return(2)
      allow(plane).to receive(:status) { "Flying" }
      subject.land(plane)
    end

    context "weather is not stormy" do
      before(:each) do
        expect(Weather).to receive(:rand).and_return(2)  
      end

      it "instructs a plane to take off" do
        allow(plane).to receive(:status) { "Landed" }
        allow(plane).to receive(:take_off)
        expect(subject.take_off("Flight 1")).to eq plane
      end
  
      it "plane is no longer in airport" do
        allow(plane).to receive(:status) { "Landed" }
        allow(plane).to receive(:take_off)
        subject.take_off("Flight 1")
        expect(subject.planes).to_not include "Flight 1"
      end

      it "doesn't let a plane take off if it's already flying" do
        allow(plane).to receive(:status) { "Flying" }
        expect { subject.take_off("Flight 1") }.to raise_error "This airport does not have this flight number"
      end
    end
    
    context "weather is stormy" do
      it "doesn't let a plane take off" do
        expect(Weather).to receive(:rand).and_return(8)
        expect { subject.take_off(plane) }.to raise_error("Cannot take off in stormy weather")
      end
    end
  end
end
