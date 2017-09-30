require 'plane'
require 'airport'
describe Plane do
  describe "#land" do
    it "expects a plane to be able to land" do
      expect(subject).to respond_to(:land)
    end
    it "expects argument of land method to be an airport" do
      airport = Airport.new
      expect(airport.class).to eq Airport
    end
  end
end
