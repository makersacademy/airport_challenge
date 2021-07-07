require 'plane.rb'

describe Plane do 
  it "Plane should create a new instances of airport" do
      bowing = Plane.new
      expect(bowing).to be_instance_of Plane
  end

  describe "#landed" do
    it "plane should land" do
      bowing = Plane.new
      expect(bowing.landed).to eq true
    end
  end

  describe "#takingoff" do
    it "plane should be able to take off" do
      bowing = Plane.new
      expect(bowing.takingoff).to eq true
    end
  end
end
