require 'plane'

describe Plane do
  it{ is_expected.to respond_to(:land).with(1).argument }

  describe "#land" do
    subject(:plane) { Plane.new }
    let(:airport) { double("airport") }
    it "returns airport when landing in airport" do
      expect(plane.land(airport)).to eq airport
    end

    it "lands the plane" do
      plane.land(airport)
      expect(plane.landed).to eq true
    end
  end

end
