require_relative '../lib/plane'

describe Plane do
  let(:plane) { Plane.new }

  context "plane in flight" do
    before do
      plane.take_off
    end

    it "takes off from the airport" do
      expect(plane).to respond_to(:take_off)
      expect(plane.is_flying).to eq true
    end
    it "ensures that planes that are already flying cannot take off from an airport" do
      expect { plane.take_off }.to raise_error "This plane is currently flying"
    end
  end

  context "plane on land" do

    it "lands the plane" do
      expect(plane).to respond_to(:land)
      expect(plane.is_flying).to eq false
    end
    it "ensures that landed planes cannot land again" do
      expect { plane.land }.to raise_error "Plane cannot land as it's already landed"
    end
  end
end
