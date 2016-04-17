require "weather"

describe Weather do
  dummy_class = Class.new { include Weather }

  describe dummy_class do

    describe "#stormy?" do
      it "should return a boolean value" do
        expect([true, false]).to include subject.stormy?
      end
    end
  end
end
