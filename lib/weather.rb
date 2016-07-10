class Weather
  def initialize
    @weather_forecast = [:stormy, :sunny, :drizzle, :raining, :cloudy, :foggy, :snowing]
  end

  def stormy?
    @weather_forecast[Random.rand(7)] == :stormy
  end
  
end
