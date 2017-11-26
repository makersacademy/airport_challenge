require "weather"

describe Weather do
  let(:weather) { Weather.new }

  describe "#stormy" do
    it "should return true if weather is stormy" do
      allow(weather).to receive(:stormy?) { true }
      expect(weather).to be_stormy
    end

    it "should return false if weather is not stormy" do
      allow(weather).to receive(:stormy?) { false }
      expect(weather).not_to be_stormy
    end
  end
end
