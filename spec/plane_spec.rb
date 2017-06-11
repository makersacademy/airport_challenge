require "plane.rb"

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double :airport, :condition_for_landing => true, :condition_for_takeoff => true, :land => plane, :take_off => plane }

  it { is_expected.to respond_to(:instruct_to_land).with(1).argument }

  describe "#instruct_to_land" do
    it "sends a message to the plane to land" do
      plane.instruct_to_land(airport)
      expect(plane.airport_to_land).to eq airport
    end
    it "lands the plane if the condition for landing are met" do
      plane.instruct_to_land(airport)
      expect(airport.land(plane)).to eq plane
      expect(plane.on_the_ground).to eq true
    end
  end

  describe "#instruct_take_off" do
    it "sends a message to the plane to take off" do
      plane.instruct_take_off(airport)
      expect(plane.airport_take_off).to eq airport
    end
    it "allows plane to take off if condition are met" do
      plane.instruct_take_off(airport)
      expect(airport.take_off(plane)).to eq plane
      expect(plane.on_the_ground).to eq false
    end
    it "raises an error if the conditions for take off are not met" do
      plane.instruct_to_land(airport)
      airport = double(:airport, :condition_for_landing => true, :land => plane, :condition_for_takeoff => false, :take_off => plane)
      expect { plane.instruct_take_off(airport) }.to raise_error("Conditions for take off are not met")
    end
  end

end
