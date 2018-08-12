require 'plane'

describe Plane do
  let(:plane)        { Plane.new }
  let(:mockairport)  { double :airport }
  let(:mockairport2) { double :airport }

  describe "#landing" do
    it "request to put plane into airport successful" do
      expect { plane.landing(mockairport) }.not_to raise_error
    end

    describe "#check_already_landed" do
      it "raises error if plane attempts to land when already in airport" do
        plane.landing(mockairport)
        message = "Plane that has already landed cannot land again"
        expect { plane.check_already_landed }.to raise_error(message)
      end
    end
  end

  describe "#taking_off" do
    it "request to take plane from airport" do
      plane.landing(mockairport)
      expect { plane.taking_off(mockairport) }.not_to raise_error
    end

    describe "#check_if_already_flying" do
      it "raises error if take off is requested when already flying" do
        message = "Flying plane cannot take off"
        expect { plane.check_if_already_flying }.to raise_error(message)
      end
    end

    describe "#check_if_in_airport_requested" do
      it "raises error if take off is requested from another airport" do
        plane.landing(mockairport)
        message = "Plane can only take off from airport it is in"
        expect { plane.check_if_in_airport_requested(mockairport2) }.to raise_error(message)
      end
    end
  end
end
