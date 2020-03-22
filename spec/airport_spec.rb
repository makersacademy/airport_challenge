require './lib/airport'

describe Airport do
  describe ".new" do
    it "check creates planes array" do
      airport = Airport.new
      expect(airport.planes).to eq([])
    end
  end

  describe "#land" do
    it "check responds to #land(plane)" do
      expect(Airport.new).to respond_to(:land).with(1).argument
    end

#    it "check #land(plane) asdds plane to @planes" do
#      Airport.new.land(Plane.new)
#      expect(Airport.new.planes).to eq([Plane.new])
#    end
  end

  describe "#take_off" do
    it "check responds to #take_off(plane)" do
      expect(Airport.new).to respond_to(:take_off).with(1).argument
    end
  end
end
