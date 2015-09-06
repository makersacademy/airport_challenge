module Weather
  def weather
    weather_rand <= 20 ? @stormy : @sunny
  end
  def weather_rand
    rand(100)
  end
end
