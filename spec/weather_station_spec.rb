require "weather_station"
describe WeatherStation do
  describe "#stormy" do
    it{is_expected.to respond_to :stormy?}
  end
end
