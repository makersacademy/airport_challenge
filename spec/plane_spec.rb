require 'plane'
require 'airport'
describe Plane do
  describe "#land" do
    it "expects a plane to be able to land" do
      expect(subject).to respond_to(:land)
    end
    it "expects land method to raise error if argument is not an airport object" do
      plane = Plane.new
      expect { plane.land("string object") }.to raise_error 'argument is not an airport object'
    end
  end
  describe "#take_off" do
    it "expects the plane to take off and set the in_the_air variable to true" do
      airport = Airport.new
      plane = Plane.new
      plane.take_off(airport)
      expect(plane.in_the_air?).to eq true
    end
  end
  describe "#airport_exited" do
    it "expects a plane to save airport ID after it has taken off " do
      airport1 = Airport.new
      plane1 = Plane.new
      plane1.take_off(airport1)
      expect(plane1.airport_exited).to eq airport1.__id__
    end
  end
end
