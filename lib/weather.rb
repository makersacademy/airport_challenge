class Weather

  attr_reader :current_weather

  WEATHER_TYPES = [:fine,:fine,:fine,:fine,:stormy]

  def initialize
    @current_weather = WEATHER_TYPES.sample
  end

  def stormy?
    @current_weather == :stormy
  end

end