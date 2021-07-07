require "plane"
describe Plane do

  describe "initialize" do
    it "creates an instance of a plane" do
      plane = Plane.new
      expect(plane).to be_an_instance_of(Plane)
    end
  end

  describe "#waiting?" do
    it "checks if the plane is waiting" do 
      plane = Plane.new
      expect(plane.waiting?).to eq true
    end
  end

end
 