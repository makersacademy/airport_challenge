class Weather

  WEATHER_CONDITION = %i(stormy normal normal normal normal)

  def initialize(weather = WEATHER_CONDITION.sample)
    @weather = weather
  end

  def stormy?
    @weather == :stormy
  end
end
