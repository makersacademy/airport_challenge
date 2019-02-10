class Weather
  BAD_WEATHER = 99

  def check_weather
    rand(100)
  end

  def stormy?
    return true if check_weather == BAD_WEATHER
  end
end
