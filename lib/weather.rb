class Weather

  attr_reader :current_weather

  WEATHER_CONDITIONS = [:sunny, :cloudy, :rainy, :windy, :stormy]

  def initialize
    @current_weather = WEATHER_CONDITIONS.sample
  end
end
