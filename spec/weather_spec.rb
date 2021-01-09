require "weather"

describe Weather do
  before(:each) do
    @rng = double("random number generator")
    subject { Weather.new(@rng) }
  end

  describe "forecast" do
    it "returns stormy" do
      allow(@rng).to receive(:rand).with(10).and_return(9)
      expect(subject.forecast).to eq "stormy"
    end

    it "returns sunny" do
      allow(@rng).to receive(:rand).with(10).and_return(0)
      expect(subject.forecast).to eq "sunny"
    end
  end
end