require './lib/airport'

describe Airport do
  describe "#land" do
    it "check responds to #land(plane)" do
      expect(Airport.new).to respond_to(:land).with(1).argument
    end
  end

  describe "#take_off" do
    it "check responds to #take_off(plane)" do
      expect(Airport.new).to respond_to(:take_off).with(1).argument
    end
  end
end
