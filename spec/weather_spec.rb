require 'weather'

describe Weather do
  describe "#stormy?" do
    it "should return a random boolean value" do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end
end
