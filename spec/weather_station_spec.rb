require "weather_station"
describe WeatherStation do
  it{is_expected.to respond_to :stormy?}

  ## impossible to test further in unit tests, ran a bunch of cycles in IRB and it responded as expected
end
