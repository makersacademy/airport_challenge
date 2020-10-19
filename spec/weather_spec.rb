require 'weather'

describe Weather do
  let(:subject) { Weather.new(0.1) }

  describe "creating a new weather instance" do
    it "returns an instance of Weather" do
      expect(subject).to be_instance_of(Weather)
    end

    it "has the weather property set to either stormy or sunny when instantiated" do
      weather_options = [:sunny, :stormy]
      expect(weather_options.include?(subject.weather)).to eq(true)
    end
  end

  describe "#generate_weather" do
    it "returns either sunny or stormy" do
      weather_options = [:sunny, :stormy]
      expect(weather_options.include?(subject.generate_weather(0.1))).to eq(true)
    end

    it "returns stormy if random number generator returns 10" do
      allow(subject).to receive(:rand).and_return(10)
      expect(subject.generate_weather(0.1)).to eq(:stormy)
    end

    it "returns sunny if random number generator returns 1-9" do
      allow(subject).to receive(:rand).and_return(8)
      expect(subject.generate_weather(0.1)).to eq(:sunny)
    end

    it "returns sunny if random number generator returns 1-9" do
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.generate_weather(0.1)).to eq(:sunny)
    end
  end
end
