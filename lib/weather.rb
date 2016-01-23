require './lib/airport.rb'


class Weather

  WEATHER_OPTIONS = [:stormy, :ok, :ok, :ok, :ok]

  def stormy?
    random_weather == :stormy
  end

  def random_weather
    WEATHER_OPTIONS.sample
  end

end
