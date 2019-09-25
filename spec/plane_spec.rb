require './lib/plane'

describe Plane do

  let(:plane){Plane.new}

  describe "#flying" do
    it "returns true" do
      expect(plane.flying?).to eq false
    end
  end

  describe "#landed" do
    it "returns false" do
      expect(plane.landed?).to eq true
    end
  end

end
