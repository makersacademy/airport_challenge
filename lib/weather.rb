class Weather
  def random_weather
    weather = rand(1..100) == 0 ? "stormy" : "sunny"
  end
end