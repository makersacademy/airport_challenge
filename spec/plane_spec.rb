require "plane"

describe Plane do

  describe "#landed?" do

    it "should return a boolean" do
      plane = Plane.new
      expect([true, false]).to include plane.landed?
    end

  end

  describe "#land" do

    it "should return true" do
      plane = Plane.new
      expect(plane.land).to eq true
    end

  end

  describe "#take_off" do

    it "should return false" do
      plane = Plane.new
      expect(plane.take_off).to eq false
    end

  end

end
