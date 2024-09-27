require "weather"

describe Weather do
  describe "#stormy?" do
    it "returns true if stormy" do
      allow(Weather).to receive(:stormy?) {true}
      expect(Weather.stormy?).to eq(true)
    end
    
    it "returns false if not stormy" do
      allow(Weather).to receive(:stormy?) {false}
      expect(Weather.stormy?).to eq(false)
    end
  end
end