
require 'weather'
require 'support/shared_examples_for_weather'

class WeatherTest
  include Weather
end

describe WeatherTest do
  it_behaves_like Weather
end
