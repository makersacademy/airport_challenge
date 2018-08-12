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

  describe "#stormy?" do
    it "delegates wether generation to weather object" do
      expect(weather).to receive(:generate)
      weather.generate
    end
  end
end
