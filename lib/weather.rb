class Weather
  attr_reader :weather
  WEATHER_TYPES = [:stormy, :sunny, :sunny, :sunny, :sunny]

  def initialize
    @weather = WEATHER_TYPES.sample
  end
end
