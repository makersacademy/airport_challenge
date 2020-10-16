require 'weather'

describe Weather do
  describe "creating a new weather instance" do
    it "returns an instance of Weather" do
      expect(Weather.new).to be_instance_of(Weather)
    end

    it "has the weather property set to either stormy or sunny when instantiated" do
      weather_options = ["sunny", "stormy"]
      expect(weather_options.include?(subject.weather)).to eq(true)
    end
  end

  describe "#generate_weather" do
    it "returns either sunny or stormy" do
      weather_options = ["sunny", "stormy"]
      expect(weather_options.include?(subject.generate_weather)).to eq(true)
    end

    it "returns stormy if random number generator returns 5" do
      allow(subject).to receive(:rand).and_return(5)
      expect(subject.generate_weather).to eq("stormy")
    end

    it "returns sunny if random number generator returns 1-4" do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.generate_weather).to eq("sunny")
    end

    it "returns sunny if random number generator returns 1-4" do
      allow(subject).to receive(:rand).and_return(4)
      expect(subject.generate_weather).to eq("sunny")
    end
  end
end
