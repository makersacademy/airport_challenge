require "weather"

describe Weather do
  it { is_expected.to respond_to(:stormy?) }
  describe "#stormy?" do
    it "is a boolean" do
      expect([true, false]).to include(subject.stormy?)
    end
  end
end
