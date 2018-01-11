class Weather

  attr_reader :current_weather

  WEATHER_TYPES = [:fine, :fine, :fine, :fine, :stormy]

  def initialize(current_weather = WEATHER_TYPES.sample)
    @current_weather = current_weather
  end

  def stormy?
    @current_weather == :stormy
  end

end
