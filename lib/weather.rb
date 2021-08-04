class Weather 

  def stormy?
    weather_forecast == :stormy
  end 

  private

  FORECAST = [:stormy, :sunny, :sunny, :sunny, :sunny]

  def weather_forecast
    FORECAST.sample
  end
end
