require "weather"

describe Weather do
  describe "#forcast" do
    it "responds to forcast method" do
      expect(subject).to respond_to :forcast
    end

    it "generates weather that is sunny or stormy" do
      expect(subject.forcast).to include("sunny").or include("stormy")
    end

    it "generates random weather - bad" do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.forcast).to eq "stormy"
    end

    it "generates random weather - good" do
      allow(subject).to receive(:rand).and_return(4)
      expect(subject.forcast).to eq "sunny"
    end
  end
end
