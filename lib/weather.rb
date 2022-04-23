class Weather

  WEATHER = [:sunny, :rainy, :stormy, :windy]

  attr_reader :current_weather

  def initialize
    @current_weather = WEATHER.sample
  end

  def stormy?
    @current_weather == :stormy
  end

end