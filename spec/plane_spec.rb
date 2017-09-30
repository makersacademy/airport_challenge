require 'plane'
require 'airport'
describe Plane do
  describe "#land" do
    it "expects a plane to be able to land" do
      expect(subject).to respond_to(:land)
    end
    it "expects land method to output true if argument is  an airport" do
      airport = Airport.new
      expect(subject.land(airport)).to eq true
    end
  end
end
