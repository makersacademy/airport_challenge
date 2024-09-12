require "weather"

describe "Weather" do
  describe "#weather" do
    it "will produce a weather from the WEATHER hash" do
      weather = Weather.new
      expect(weather.weather).to(eq("sunny" || "stormy"))
    end
  end
end
