class Weather
  def initialize
    @weather = [:sunny, :stormy]
  end
  def storm_probability
    rand(101)
  end
  def condition
    return 1 if storm_probability > 90
    0
  end
  def weather_report
    @weather[condition]
  end
end
