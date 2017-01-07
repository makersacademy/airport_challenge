require "weather_station"
describe WeatherStation do
  describe "#stormy" do
    it{is_expected.to respond_to :stormy?}
  end
  ## impossible to test further in unit tests,
  ## ran a bunch of cycles in IRB and it responded as expected
end
