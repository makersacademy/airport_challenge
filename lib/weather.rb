class Weather

  def stormy?
    weather_today == :stormy
  end

  private

  WEATHER_CHART = [:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny]

  def weather_today(weather_chart: WEATHER_CHART)
    weather_chart.sample
  end
end
