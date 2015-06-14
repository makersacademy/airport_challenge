require './lib/weather'
require './spec/support/shared_examples_for_weather_test'

class WeatherTest
  include Weather
end

describe WeatherTest do
  it_behaves_like Weather
end