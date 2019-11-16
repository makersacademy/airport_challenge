require 'plane'

describe Plane do

  describe "#grounded" do
    it "returns true when a plane is grounded" do
      expect(subject.grounded).to eq true
    end
  end

  describe "#flying" do
    it "returns true when a plane is flying" do
      expect(subject.flying).to eq true
    end
  end
end
