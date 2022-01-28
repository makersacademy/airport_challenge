require_relative '../lib/plane'

describe Plane do
  describe "#land" do
    it "should land a plane at an airport" do
      plane = Plane.new
      expect(plane).to respond_to(:land)
    end
  end
end
