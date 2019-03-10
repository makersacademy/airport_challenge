class Weather
  def current_weather
    random = Random.rand(1..50)
    p random
    return "Sunny" if random != 25

    return "Stormy"
  end
end
