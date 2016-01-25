require "./lib/Plane.rb"

describe Plane do
  subject(:plane) { described_class.new }

  describe "#landing and inconsistancy" do

    it "can be landed" do
      plane.land
      expect(plane.landed).to eq true
      expect(plane.in_flight).to eq false
    end

    it "raises an error if you try to land a plane that is already landed" do
      plane.land
      expect{plane.land}.to raise_error(RuntimeError)
    end

  end

  describe "#takeoff" do

    it "can take off and be in flight" do
      plane.take_off
      expect(plane.in_flight).to eq true
      expect(plane.landed).to eq false
    end

    it "raises an error if you try to takeoff a plane that's already in flight" do
      plane.take_off
      expect{plane.take_off}.to raise_error(RuntimeError)
    end

  end

end
