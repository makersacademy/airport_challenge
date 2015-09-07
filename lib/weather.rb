module Weather

  def weather
    weather_rand <= 10 ? @stormy : @sunny
  end
  def weather_rand
    rand(100)
  end
end
