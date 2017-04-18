require 'weather'

describe Weather do
  describe "#chance_of_storm" do
    it "returns a random number between 0 & 9" do
      expect(subject.chance_of_storm <= 9).to eq subject.chance_of_storm >= 0
    end
  end
  describe "#stormy?" do
    it "returns a stormy weather" do
      allow(subject).to receive(:chance_of_storm) { 9 }
      expect(subject.stormy?).to be true
    end
    it "returns a clear weather" do
      allow(subject).to receive(:chance_of_storm) { 8 }
      expect(subject.stormy?).to be false
    end
  end
end
