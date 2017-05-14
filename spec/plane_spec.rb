require 'plane'

RSpec.describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe "#landed" do
    it "check if the plane is flying" do
      expect(plane.landed).to eq false
    end
  end

  describe "#take_off" do
    it "after #take_off the plane is flying and not landed" do
      allow(airport).to receive(:authorize_take_off) { true }
      plane.take_off(airport)
      expect(plane.landed).to eq false
    end
  end

  describe "#land" do
    it "after #land the plane is landed and not flying" do
      allow(airport).to receive(:authorize_landing) { true }
      plane.land(airport)
      expect(plane.landed).to eq true
    end
  end

end
