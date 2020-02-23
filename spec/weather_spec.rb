require "weather"

describe WeatherReport do

  describe "#current_weather" do
    it "Provides weather report on the airport" do
      airport = Airport.new
      expect(subject.current_weather(airport)).to eq("sunny").or eq("stormy")
    end
  end

end
