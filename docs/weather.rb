class Weather
  WEATHER_CONDITIONS = [:stormy, :sunny]

  def stormy?
    random_weather_condition == :stormy
  end

  def random_weather_condition
    WEATHER_CONDITIONS.sample
  end
end
