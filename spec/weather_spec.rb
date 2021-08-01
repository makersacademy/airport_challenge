require "weather"

describe Weather do
  context "#stormy? method" do
    it "should return a boolean" do
      expect(Weather.stormy?).to eq(true).or eq(false)
    end
  end
end
