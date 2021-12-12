require "airport"

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }
  describe "#landed?" do
    it "returns true if plane has landed at an airport" do
      expect(plane.landed?).to eq false
    end
  end
end
