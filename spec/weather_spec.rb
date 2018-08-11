require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  describe "#stormy?" do
    it "returns true if stormy is picked" do
      allow(weather).to receive(:random_pick) { "stormy" }
      expect(weather.stormy?).to eq true
    end
  end

  describe "#random_pick" do
    it "returns either stormy or fine" do
      expect(weather.random_pick).to eq("stormy") || ("fine")
    end
  end
end
