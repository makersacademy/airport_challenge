class Weather
  # 1 in 4 chance of being stormy
  WEATHER = [:stormy, :fine, :fine, :fine]

  def stormy?
    random_weather == :stormy
  end

  def random_weather
    WEATHER.sample
  end

end
