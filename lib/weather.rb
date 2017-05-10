class Weather

  WEATHER_CONDITION = %i(stormy normal normal normal normal)

  def stormy?
    WEATHER_CONDITION.sample == :stormy
  end
end
