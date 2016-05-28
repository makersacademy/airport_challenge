require "weather"

describe Weather do
  describe "#state" do
    it "should set a weather state" do
      expect(subject).to respond_to(:state)
      p subject.state
    end
  end
end
