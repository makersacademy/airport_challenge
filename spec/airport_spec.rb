require "airport"
describe Airport do
  let(:airport) { Airport.new }
  
  describe "initialize" do
    it "creates an instance of an airport" do
      expect(airport).to be_an_instance_of(Airport)
    end
  end
  
  describe "#take_off" do
    it "takes off waiting planes" do
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end
  end
    
  describe "#take_off" do
    it "raises an error when there are no waiting planes" do
      expect { airport.take_off }.to raise_error "No waiting planes"
    end
  end
      
  describe "#land" do
    it "lands flying planes" do
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end
  end
  
  describe "#land" do
    it "raises an error when the airport is full" do
      airport.land(Plane.new)
      expect { airport.land Plane.new }.to raise_error "Airport is full"
    end
  end
  
  describe "#hangar_report" do
    it "returns planes that landed" do
      plane = Plane.new
      airport.land(plane)
      expect(airport.hangar_report).to eq plane
    end
  end
    
end
