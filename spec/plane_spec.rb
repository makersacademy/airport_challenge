require 'plane'

describe Plane do

  describe "#grounded" do
    it "returns :grounded when a plane is grounded" do
      expect(subject.grounded).to eq :grounded
    end
  end

  describe "#flying" do
    it "returns :flying when a plane is flying" do
      expect(subject.flying).to eq :flying
    end
  end

  describe "#available_to_land?" do
    it "returns true if the plane is flying" do
      expect(subject.available_to_land?).to eq true
    end
  end
end
