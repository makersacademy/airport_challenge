class WeatherStation
  def status
    the_weather_is_good = [true, true, true, false].sample
    return the_weather_is_good ? "☀️" : "⛈"
  end
end