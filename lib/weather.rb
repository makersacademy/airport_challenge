class Weather
  def initialize
    @weather_forecast = [:stormy,
      :sunny,
      :drizzle,
      :raining,
      :cloudy,
      :foggy,
      :a_monkeys_wedding]
  end

  def stormy?
    @weather_forecast[Random.rand(7)] == :stormy
  end

end
