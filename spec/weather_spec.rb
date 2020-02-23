require "weather"
#
# describe WeatherReport do
#
  describe "#current_weather" do
    # it "Provides weather report" do
    #   expect(current_weather).to eq("sunny").or eq("stormy")
    # end
    it "Provides weather report on the airport" do
      airport = double("airport")
      expect(current_weather(airport)).to eq("sunny").or eq("stormy")
    end
  end
#
# end
