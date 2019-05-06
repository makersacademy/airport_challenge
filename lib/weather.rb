class Weather
  FORECAST = [:stormy, :sunny, :cloudy]

  def stormy?
    random_forecast == :stormy
  end
  
  def random_forecast
    FORECAST.sample 
  end
end
