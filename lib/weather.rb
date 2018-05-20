class Weather

  WEATHER = [:stormy, :not_stormy]

  def random_weather
    WEATHER.sample
  end

  def stormy?
    true if random_weather == :stormy
  end

end
