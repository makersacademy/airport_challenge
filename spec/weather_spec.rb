require "weather"

describe Weather do
  describe ".current" do
    it "should return current weather (sunny or stormy) when called" do
      expect(subject.current).to(eq("sunny" || "stormy"))
    end
  end
end
