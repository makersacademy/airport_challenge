require './lib/plane'

describe Plane do
  describe "#land" do
    it "check responds to #land(airport)" do
      expect(Plane.new).to respond_to(:land).with(1).argument
    end
  end

  describe "#take_off" do
    it "check responds to #take_off(airport)" do
      expect(Plane.new).to respond_to(:take_off).with(1).argument
    end
  end
end
