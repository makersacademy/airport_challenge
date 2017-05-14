require 'weather'

RSpec.describe Weather do
  subject(:weather) { described_class.new }

  describe "#random" do
    it "generates a random number 1-10" do
      expect(weather.random).to be_between(1, 10)
    end
  end

  describe "#clear?" do
    it "check if the weather is stormy #random returns 10" do
      allow(weather).to receive(:random) { 10 }
      expect(weather.clear?).to eq false
    end
  end

end
