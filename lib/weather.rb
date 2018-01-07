class Weather
  attr_reader :weather

  def initialize
    @weather = set_weather
  end

  def stormy?
    @weather == :stormy
  end

  private

  WEATHER_TYPES = [:stormy, :sunny, :sunny, :cloudy, :cloudy, :rainy]

  def set_weather
    WEATHER_TYPES.sample
  end
end
