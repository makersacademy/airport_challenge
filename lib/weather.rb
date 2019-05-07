class Weather
  FORECAST = [:stormy, :sunny]

  def stormy?
    random_forecast == :stormy
  end
  
private

  def random_forecast
    FORECAST.sample 
  end
  
end
