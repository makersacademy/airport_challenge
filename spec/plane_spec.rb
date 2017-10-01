require 'plane'

describe Plane do
  subject(:plane) {Plane.new}

  describe "#ground" do
    it "stops flying when landed" do
      plane.ground
      expect(plane.flying).to eq(false)
    end
  end

  describe "#fly" do
    it "is flying after take-off" do
      plane.fly
      expect(plane.flying).to eq(true)
    end
  end
end
