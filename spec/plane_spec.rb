require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe "#land" do

    it "sets flying to false" do
      plane.instance_variable_set(:@flying, true)
      expect(plane.land).to eq false
    end

    it "should raise error if plane already landed" do
      plane.instance_variable_set(:@flying, false)
      expect{ plane.land }.to raise_error "Plane is already on the ground"
    end
  end

  describe "#takeoff" do

    it "sets flying to true" do
      plane.instance_variable_set(:@flying, false)
      expect(plane.takeoff).to eq true
    end

    it "should raise error if plane already flying" do
      plane.instance_variable_set(:@flying, true)
      expect{ plane.takeoff }.to raise_error "Plane is already in the air"
    end
  end

end