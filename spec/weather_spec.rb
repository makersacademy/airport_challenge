require "weather"

describe Weather do
  describe "#stormy" do
    it "returns true or false for a randomised weather condition" do
      expect(subject.stormy?).to eq(true).or(eq(false))
    end
  end
end
