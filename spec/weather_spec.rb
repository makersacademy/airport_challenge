require "weather"

describe Weather do
  describe "stormy?" do
    it "gives back true a determined 50% of times" do
      arr = []
      10_000.times { arr << Weather.stormy? }
      expect(arr.count(true)).to be_between(450, 550)
    end
  end
end
