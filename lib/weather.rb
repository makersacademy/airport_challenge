class Weather

  def stormy?
    random_weather == :stormy
  end

  private

  WEATHER = [:stormy, :sunny, :sunny]

  def random_weather
    WEATHER.sample
  end

end
