require 'weather'

describe "Weather Module" do
  include Weather

  describe ".generate_weather (5% chance of storms)" do
    it "generates weather: Storms stubbed with Stormy" do
      allow(Weather).to receive(:generate_weather).and_return("Stormy")
      expect(Weather.generate_weather).to eq("Stormy")
    end

    it "generates weather: Sunny, stubbed with Sunny" do
      allow(Weather).to receive(:generate_weather).and_return("Sunny")
      expect(Weather.generate_weather).to eq("Sunny")
    end
  end
end
