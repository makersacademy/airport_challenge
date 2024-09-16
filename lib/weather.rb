class Weather
  def current
    weather_number = rand(10)
    weather_number == 1 ? weather = "stormy" : weather = "sunny"
  end
end
