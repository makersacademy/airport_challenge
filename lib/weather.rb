class Weather

  def weather_today
    weather_chart = [:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny]
    weather_chart.sample
  end

  def stormy?
    weather_today == :stormy
  end
end
