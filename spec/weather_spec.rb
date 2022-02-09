require "weather"

describe Weather do

  describe "#stormy?" do
    it "returns :stormy when weather = 13" do
      allow_any_instance_of(Weather).to receive(:rand).and_return(13)
      expect(subject.weather).to eq :stormy
    end

    it "returns :sunny when weather is not 13" do
      allow_any_instance_of(Weather).to receive(:rand).and_return(1)
      expect(subject.weather).to eq :sunny
    end
  end

end
