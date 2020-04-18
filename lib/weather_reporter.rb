class WeatherReporter
  def check_weather
    return "Stormy" if rand >= 0.8
    "Sunny"
  end
end