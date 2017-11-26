require "weather"

describe Weather do
  describe "#stormy" do
    it "is stormy" do
      subject.forecast = true
      expect(subject).to be_stormy
    end

    it "is not stormy" do
      expect(subject).not_to be_stormy
    end
  end
end
