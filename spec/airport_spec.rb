require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double("a plane") }

  describe "#land" do
    it "returns plane when landed" do
      expect(airport.land(plane)).to include plane
    end
  end

  describe "#take_off" do
    before :each do
      airport.land(plane)
    end
    it "removes plane from airport and returns planes array" do
      expect(airport.take_off(plane)).not_to include plane
    end
  end

end
