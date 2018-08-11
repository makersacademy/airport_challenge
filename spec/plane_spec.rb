require 'plane'

describe Plane do
  let(:plane)   { Plane.new }
  let(:mockairport) { double :airport }

  describe "#land" do
    it "puts plane into airport hanger" do
      expect { plane.land(mockairport) }.not_to raise_error
    end
  end

  describe "#take_off" do
    it "takes plane from airport hanger" do
      expect { plane.take_off(mockairport) }.not_to raise_error
    end
  end

end
