require "weather"

describe Weather do
  describe ".current" do
    it "should return current weather (sunny or stormy) when called" do
      expect(subject.current).to(eq("sunny" || "stormy"))
    end
  end
  describe ".random_number" do
    it "should return number between 0 and 10" do
      expect(subject.random_number).to(be_within(5).of(5))
    end
  end
end
