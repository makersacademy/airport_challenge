require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  describe "#stormy?" do
    it "checks for stormy weather" do
      allow(weather).to receive(:rand) { 0 }
      expect(weather.stormy?).to eq(true)
      allow(weather).to receive(:rand) { 1 }
      expect(weather.stormy?).to eq(false)
    end
  end
end
