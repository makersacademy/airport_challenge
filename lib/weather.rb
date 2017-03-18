class Weather

  #def initialize
  #  @weather_forecast ==
  #end

  def stormy?
    weather_forecast == :stormy
  end

private

  FORECASTS = [:stormy, :sunny]

  def weather_forecast
    FORECASTS.sample
  end
end
