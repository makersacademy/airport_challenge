class WeatherForecaster
  def current
    rand(11) == 10 ? "Stormy" : "Sunny"
  end
end
