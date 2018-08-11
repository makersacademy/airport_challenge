require 'plane'

describe Plane do
  let(:plane)        { Plane.new }
  let(:mockairport)  { double :airport, put_in_airport: true, take_from_airport: true }
  let(:mockairport2) { double :airport, put_in_airport: true, take_from_airport: true }

  describe "#land" do
    it "request to put plane into airport" do
      expect { plane.land(mockairport) }.not_to raise_error
    end

    it "raises error if plane attempts to land what already in airport" do
      plane.land(mockairport)
      message = "Plane that has already landed cannot land again"
      expect { plane.land(mockairport) }.to raise_error(message)
    end
  end

  describe "#take_off" do
    it "request to take plane from airport" do
      plane.land(mockairport)
      expect { plane.take_off(mockairport) }.not_to raise_error
    end

    it "raises error if take off is requested from another airport" do
      plane.land(mockairport)
      message = "Plane can only take off from airport it is in"
      expect { plane.take_off(mockairport2) }.to raise_error(message)
    end
  end
end
