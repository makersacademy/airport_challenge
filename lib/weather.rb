class Weather 

  def stormy?
    weather_forecast == :stormy
  end 

  private

  # FORECAST = [:stormy, :sunny, :sunny, :raining, :cloudy, :sunny]
  FORECAST = [:stormy, :stormy, :stormy, :stormy, :stormy]

  def weather_forecast
    FORECAST.sample
  end
end