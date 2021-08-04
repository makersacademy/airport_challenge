class Weather

  def stormy?
    weather_today == :stormy
  end

  private

  WEATHER_CHART = [:sunny, :sunny, :sunny, :stormy]

  def weather_today(weather_chart: WEATHER_CHART)
    weather_chart.sample
  end
end
