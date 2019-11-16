class Weather
  attr_reader :weather_forecast

  def initialize
    @weather_forecast = rand(10)
  end

  def stormy?
    @weather_forecast <= 2
  end
end
