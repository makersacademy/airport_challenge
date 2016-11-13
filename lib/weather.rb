class Weather

  def stormy?
    random_weather == :stormy
  end

  WEATHER = [:stormy, :sunny, :sunny]

  def random_weather
    WEATHER.sample
  end

end
