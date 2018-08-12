require "Airport"
describe Airport do

    # Doubles
    # Plane class
    # Instance of plane class
  let(:plane) { double :plane_instance }

    # Weather class
    # Instance of weather class
  let(:weather_class) { double :weather_class, new: weather }
  let(:weather)       { double :weather_instance            }
  subject(:airport) { described_class.new }

  describe "#land" do
    it "Lands a plane" do
      airport.land(plane)
      expect(airport.land(plane)).to eq "#{plane} has landed"
    end
  
    context "stormy weather" do
      it "does not allow a plane to land" do
      end
    end 
  end

  describe "#takeoff" do
    it "Allows a plane to take off, confirm it is no longer in the hangar" do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "#{plane} has taken off"
      expect(airport.hangar).not_to include(plane)
    end 
  
    context "stormy weather" do
      it "does not allow a plane to takeoff" do
      end
    end 
  end

  describe "#isStormy" do
    context "stomry" do
      it "return true" do
        allow(weather).to receive(:generate) { "Stomry" }
        expect(airport.isStormy?).to eq true
      end
    end

    context "sunny" do
      it "returns false" do
        allow(weather).to receive(:generate) { "Sunny" }
        expect(airport.isStormy?).to eq false
      end  
    end 
  end
end
