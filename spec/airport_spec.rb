require "airport"
describe Airport do
  describe "initialize" do
    it "can creates an instance of an airport" do
      airport = Airport.new
      expect(airport).to be_an_instance_of(Airport)
    end
  end
  
  describe "#land" do
    it "can land planes" do
      airport = Airport.new
      airport.land(1)
      expect(airport.hangar_report).to eq(1)
    end
  end
    
end
