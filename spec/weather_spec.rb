require 'weather'

RSpec.describe Weather do
  subject(:weather) { described_class.new }

  describe "#random" do
    it "generates a random number 1-10" do
      expect(weather.random).to be_between(1, 10)
    end
  end

  describe "#clear?" do
    it "check if the weather is stormy based" do
      expect(weather.clear?).to eq true
    end
  end

end
