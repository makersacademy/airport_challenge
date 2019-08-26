class Weather

  def random_weather
    rand(2)
  end

  def weather_forcast(random_weather)
    return 'stormy' if random_weather == 1
    return 'sunny' if random_weather == 0
  end

end
