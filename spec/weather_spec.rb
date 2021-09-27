require "weather"

describe Weather do
  describe ".current" do
    it "should respond to the .current method" do
      expect(subject).to(respond_to(:current))
    end
    it "should return either 'stormy' or 'sunny'" do
      expect(["stormy", "sunny"]).to(include(subject.current))
    end
  end
end
