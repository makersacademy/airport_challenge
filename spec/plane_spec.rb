require 'plane'

describe Plane do
  context "Check airborne" do
    it "plane should be airborne" do
      plane = Plane.new(true)
      expect(plane.airborne).to eq true
    end

    it "plane should not be airborne" do
      plane = Plane.new(false)
      expect(plane.airborne).to eq false
    end

    it "can set plane to be airborne" do
      plane = Plane.new(false)
      plane.airborne = true
      expect(plane.airborne).to eq true
    end

  end
end
