require 'plane'

RSpec.describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe "#landed" do
    it "check if the plane is landed" do
      expect(plane.landed).to eq true
    end
  end

  describe "#take_off" do
    it "change the status of a plane from landed to in flight" do
      allow(airport).to receive(:authorize_take_off) { true }
      plane.take_off(airport)
      expect(plane.landed).to eq false
    end

    it "after #take_off the plane is flying and not landed" do
      allow(airport).to receive(:authorize_landing) { true }
      allow(airport).to receive(:authorize_take_off) { true }
      plane.land(airport)
      plane.take_off(airport)
      expect(plane.landed).to eq false
    end
  end

end
