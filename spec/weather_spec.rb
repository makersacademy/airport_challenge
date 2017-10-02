require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  describe "#stormy?" do
    it "returns true when stormy" do
      allow(weather).to receive(:rand) { 0 }
      expect(weather.stormy?).to eq(true)
    end

    it "returns false when not stormy" do
      allow(weather).to receive(:rand) { 1 }
      expect(weather.stormy?).to eq(false)
    end
  end
end
