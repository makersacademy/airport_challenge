require 'weather_reporter'

describe WeatherReporter do
  it { is_expected.to respond_to(:check_weather) }
end