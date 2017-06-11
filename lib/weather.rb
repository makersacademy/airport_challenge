class Weather

  def stormy?
    change_weather == :stormy
  end

  def change_weather
    forecast = [:stormy, :sunny, :sunny, :sunny, :sunny]
    forecast.sample
  end

end
