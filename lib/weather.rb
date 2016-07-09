class WeatherReport
  def weather_conditions
    self.weather_gauge == 5 ? "stormy" : "clear"
  end

  def weather_gauge
    rand(0..5)
  end
end
