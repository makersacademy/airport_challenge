require 'plane'

RSpec.describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport, authorize_landing: true, authorize_take_off: true }

  describe "#take_off" do
    it "a plane already flying can't take off again" do
      plane.land(airport)
      plane.take_off(airport)
      expect { plane.take_off(airport) }.to raise_error "The plane is already in flight"
    end
  end

  describe "#land" do
    it "a plane already landed can't land again" do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error "The plane is already on the ground"
    end
  end
end
