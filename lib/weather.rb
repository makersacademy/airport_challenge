class Weather
  def stormy?
    weather_forecast = [:stormy, :sunny, :drizzle, :raining, :cloudy, :foggy, :snowing]
    weather_forecast[Random.rand(7)] == :stormy
  end
end
