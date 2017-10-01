class weather
  attr_reader :weather

  WEATHER_TYPES = [:stormy, :sunny, :sunny, :sunny, :sunny]

  def initialize(weather)
    get_weather
  end

  def get_weather
    @weather = WEATHER_TYPES.sample
  end

end
