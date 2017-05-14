require 'airport'

RSpec.describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe "#land" do
    it "makes a plane land at an airport" do
      expect(airport.authorize_landing(plane)).to eq [plane]
    end
  end

  describe "#planes" do
    it "return the planes currently landed at the airport" do
      airport.authorize_landing(plane)
      expect(airport.planes).to eq [plane]
    end
  end

  describe "#authorize_take_off" do
    it "the plane can take off from the airport" do
      airport.authorize_landing(plane)
      expect(airport.authorize_take_off(plane)).to eq plane
    end

    it "raises an error if there are no planes available for take off" do
      expect { airport.authorize_take_off(plane) }.to raise_error "No planes currently available"
    end

  end

end
