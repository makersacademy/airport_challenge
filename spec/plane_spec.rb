require './lib/plane'

describe Plane do

  describe "#flying" do
    it "returns true" do
      expect(subject.flying).to eq true
    end
  end

  describe "#landed" do
    it "returns false" do
      expect(subject.landed).to eq false
    end
  end

  describe "#flying?" do
    it "returns true if is flying" do
      subject.flying
      expect(subject.flying?).to eq true
    end

    it "returns false if is landed" do
      subject.landed
      expect(subject.landed).to eq false
    end
  end
end
