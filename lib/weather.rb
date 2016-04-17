class Weather

  attr_reader :weather

  def initialize
    @weather = weather
  end

  def stormy?
    rand_weather == :stormy
  end

  WEATHER_TYPES = [:fine, :fine, :stormy, :fine, :fine]

  def rand_weather
    WEATHER_TYPES.sample
  end
end
