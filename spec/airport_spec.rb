require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {Plane.new}
  #let(:plane) {Plane.new}

  describe "#plane_landing" do
    it "responds with 1 argument" do
      expect(airport).to respond_to(:plane_landing).with(1).argument
    end

    it "airport stores plane that has landed" do
      airport.plane_landing(plane)
      expect(airport.look_at_planes).to include(plane)
    end
  end


end
