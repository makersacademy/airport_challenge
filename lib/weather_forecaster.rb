class WeatherForecaster
  def current
    rand(10) > 8 ? "Stormy" : "Sunny"
  end
end
