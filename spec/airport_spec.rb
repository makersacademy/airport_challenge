require 'airport'

RSpec.describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe "#land" do
    it "makes a plane land at an airport" do
      expect(airport).to respond_to(:land).with(1).argument
      expect(airport.land(plane)).to eq [plane]
    end
  end

  describe "#planes" do
    it "return the planes currently landed at the airport" do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end
  end

  describe "#take_off" do
    it "the plane can take off from the airport" do
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end

    it "raises an error if there are no planes available for take off" do
      expect { airport.take_off }.to raise_error "No planes currently available"
    end

  end

end
