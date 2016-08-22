require_relative "airport"
require_relative "plane"

module AirTrafficControl

WEATHER = [:sunny, :sunny, :sunny, :stormy]

  def weather
      @weather = WEATHER
  end

  def current_weather_condition
    weather.sample
  end

  def stormy?
    current_weather_condition == :stormy
  end
end
