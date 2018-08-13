require "Airport"
describe Airport do

    # Doubles
    # Plane class
    # Instance of plane class
  let(:plane) { double :plane_instance }

    # Weather class
    # Instance of weather class
  let(:weather_class) { double :weather_class, new: weather }
  let(:weather)       { double :weather_instance }
  subject(:airport)   { described_class.new }

  describe "#land" do
    it "Lands a plane" do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect(airport.land(plane)).to eq "#{plane} has landed"
    end
  
    context "stormy weather" do
      it "does not allow a plane to land" do
        allow(airport).to receive(:stormy?) { true }
        expect { airport.land(plane) }.to raise_error("Cannot land due to storm")
        expect(airport.hangar).not_to include(plane)
      end
    end 
  end

  describe "#takeoff" do
    it "Allows a plane to take off, confirm it is no longer in the hangar" do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "#{plane} has taken off"
      expect(airport.hangar).not_to include(plane)
    end 

    context "plane not in hangar" do
      it "returns pessage that plane is not in hangar" do
        expect { airport.take_off(plane) }.to raise_error("This plane is not in the hangar")
      end
    end
  
    context "stormy weather" do
      it "does not allow a plane to takeoff" do
        allow(airport).to receive(:stormy?) { false }
        airport.land(plane)
        allow(airport).to receive(:stormy?) { true }
        expect { airport.take_off(plane) }.to raise_error("Cannot takeoff due to storm")
      end
    end 
  end

  describe "#stormy?" do
    it "delegates wether generation to weather object" do
      expect(weather).to receive(:generate)
      weather.generate
    end
  end

  describe "at_capacity?" do
    it "checks if hangar is at maximum capacity" do
      airport.land(plane)
      p2 = Plane.new
      airport.land(p2)
      p3 = Plane.new
      airport.land(p3)
      p4 = Plane.new
      airport.land(p4)
      p5 = Plane.new
      airport.land(p5) 
      expect(airport.at_capacity?).to eq true
      p6 = Plane.new
      expect(airport.hangar.length).to eq 5
    end 
  end
end
