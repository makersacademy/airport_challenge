require "plane"

describe Plane do

  let(:plane) { described_class.new }

  describe "#land" do
    before do
      plane.land
    end
    it "should set the status to landed = true" do
      expect(plane.landed).to eq true
    end
  end

  describe "#take_off" do
    before do
      plane.take_off
    end
    it "should set the status to landed = false" do
      expect(plane.landed).to eq false
    end
  end

end
