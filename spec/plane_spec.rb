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
    it "a plane already flying can't take off again" do
      allow(airport).to receive(:authorize_landing) { true }
      plane.land(airport)
      allow(airport).to receive(:authorize_take_off) { true }
      plane.take_off(airport)
      expect { plane.take_off(airport) }.to raise_error "The plane is already in flight"
    end
  end

  describe "#land" do
    it "a plane already landed can't land again" do
      allow(airport).to receive(:authorize_landing) { true }
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error "The plane is already on the ground"
    end
  end

end
