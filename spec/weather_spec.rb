require "weather"

describe Weather do
  subject { Weather.new(@rng) }

  before(:each) do
    @rng = double("random number generator")
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
