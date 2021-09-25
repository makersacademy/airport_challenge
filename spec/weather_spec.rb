require "weather"

describe Weather do
  describe ".current" do
    it "should respond to the .current method" do
      expect(subject).to(respond_to(:current))
    end
  end
  describe ".random_number" do
    it "should return number between 0 and 10" do
      expect(subject.random_number).to(be_within(5).of(5))
    end
  end
end
