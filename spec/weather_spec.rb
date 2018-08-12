require "weather"

describe Weather do

  describe "#report" do
    it "returns sunny or stormy" do
      expect(["sunny", "stormy"]).to include(subject.report)
    end
  end

end
