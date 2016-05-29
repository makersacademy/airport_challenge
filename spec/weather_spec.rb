require "weather"

describe Weather do
  describe "#stormy?" do
    it "returns true if stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to eq(true)
    end

    it "returns false if not stormy" do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.stormy?).to eq(false)
    end
  end
end
