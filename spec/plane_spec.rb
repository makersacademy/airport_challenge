require 'plane'

describe Plane do
  let(:plane)        { Plane.new }
  let(:mockairport)  { double :airport }
  let(:mockairport2) { double :airport }

  describe "#land" do
    it "request to put plane into airport successful" do
      expect { plane.landing(mockairport) }.not_to raise_error
    end

    it "raises error if plane attempts to land when already in airport" do
      plane.landing(mockairport)
      message = "Plane that has already landed cannot land again"
      expect { plane.landing(mockairport) }.to raise_error(message)
    end
  end

  describe "#take_off" do
    it "request to take plane from airport" do
      plane.landing(mockairport)
      expect { plane.taking_off(mockairport) }.not_to raise_error
    end

    it "raises error if take off is requested when already flying" do
      message = "Flying plane cannot take off"
      expect { plane.taking_off(mockairport) }.to raise_error(message)
    end

    it "raises error if take off is requested from another airport" do
      plane.landing(mockairport)
      message = "Plane can only take off from airport it is in"
      expect { plane.taking_off(mockairport2) }.to raise_error(message)
    end
  end
end
