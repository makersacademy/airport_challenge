class Weather
  def stormy?
    random_weather == :stormy
  end
  
  private

  WEATHER_TYPES = [:rainy, :sunny, :stormy]

  def random_weather
    WEATHER_TYPES.sample
  end

end