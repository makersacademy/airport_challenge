require 'plane'

RSpec.describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe "#landed" do
    it "check if the plane is landed" do
      expect(plane.landed?).to eq true
    end
  end

  describe "#in_flight" do
    it "change the status of a plane from landed to in flight" do
      plane.in_flight
      expect(plane.landed?).to eq false
    end

    it "after #take_off the plane is #in_flight and not landed" do
      allow(airport).to receive(:land)
      allow(airport).to receive(:take_off)
      airport.land(plane)
      airport.take_off
      plane.in_flight
      expect(plane.landed?).to eq false
    end
  end

end
