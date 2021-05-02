class WeatherForecaster
  def get_current
    num = rand(11)
    num == 10 ? "Stormy" : "Sunny"
  end
end