class Weather
  WEATHER_TYPES = ["Sunny", "Sunny", "Sunny", "Sunny", "Sunny", "Sunny", "Stormy"]

  attr_reader :weather

  def initialize(weather = (WEATHER_TYPES.sample))
    @weather = weather
  end

  def check
    @weather = (WEATHER_TYPES.sample)
    weather
  end

end
