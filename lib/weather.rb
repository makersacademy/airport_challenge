class Weather

  def stormy?
    weather_forecast == :stormy
  end

private

  FORECASTS = [:stormy, :sunny, :sunny, :sunny]

  def weather_forecast
    FORECASTS.sample
  end
end
