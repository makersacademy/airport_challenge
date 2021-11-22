class Weather
  attr_reader :weather

  WEATHER_SCALE = 10

  def initialize
    @weather = rand(WEATHER_SCALE)
  end

  def stormy?
    weather >= WEATHER_SCALE
  end
end
