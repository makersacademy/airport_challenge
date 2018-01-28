require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  let(:airport) { double("airport", land: [plane], take_off: []) }

  describe "#land" do

    context "when plane landed" do
      before :each do
        plane.land(airport)
      end
      it "raises 'Plane already landed' error" do
        expect { plane.land(airport) }.to raise_error "Plane already landed"
      end
    end

    context "when plane flying" do
      before :each do
        plane.take_off(airport)
      end

      it "instructs the airport to receive plane" do
        expect(airport).to receive(:land)
        plane.land(airport)
      end

      it "lands the plane" do
        expect(plane.land(airport)).to eq true
      end
    end
  end

  describe "#take_off" do
    before :each do
      plane.take_off(airport)
    end

    context "when plane flying" do
      it "raises 'Plane already flying' error" do
        expect { plane.take_off(airport) }.to raise_error "Plane already flying"
      end
    end

    context "when plane landed" do
      before :each do
        plane.land(airport)
      end

      it "instructs the airport to release the plane" do
        expect(airport).to receive(:take_off)
        plane.take_off(airport)
      end

      it "Takes off from the airport" do
        expect(plane.take_off(airport)).to eq false
      end
    end

  end

end
