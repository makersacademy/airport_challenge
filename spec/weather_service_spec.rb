require "weather_service"

describe Weather_Service do
  describe "#current_weather" do
    it "returns either stormy or sunny" do
      airport = double("airport")
      expect(subject.current_weather(airport)).to eq("stormy").or eq("sunny")
    end
  end
end
