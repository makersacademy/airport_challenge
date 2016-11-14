require 'weather'

describe Weather do
  subject(:weather) {described_class.new}
  describe "outputting the weather" do
    it "returns stormy" do
      allow(weather).to receive(:randomize).and_return(:stormy)
      expect(weather.stormy?).to be true
    end
    it "returns clear" do
      allow(weather).to receive(:randomize).and_return(:clear)
      expect(weather.stormy?).not_to be true
    end
  end
  describe "randomizing the weather" do
    it "outputs :stormy" do
      allow(weather).to receive(:randomize).and_return(:stormy)
      expect(weather.randomize).to be :stormy
    end
    it "outputs :clear" do
      allow(weather).to receive(:randomize).and_return(:clear)
      expect(weather.randomize).to be :clear
    end
  end
end
