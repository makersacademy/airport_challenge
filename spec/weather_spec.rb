require "weather"

describe Weather do
  describe "#report" do
    it "should report weather" do
      expect(subject).to respond_to(:report)
      p subject.report
    end
  end
end
