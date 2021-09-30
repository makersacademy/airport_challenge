class Weather
  def working?
    true
  end

  def weather_forecast
    @forecast = ["sunny", "sunny", "sunny", "sunny", "stormy"].sample
  end
end
