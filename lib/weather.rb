class Weather

  attr_accessor :weather_condition

  def what_weather
    weather = [:sunny, :sunny, :sunny, :sunny, :sunny, :stormy]
    @weather_condition = weather.sample
  end

  def stormy?
    @weather_condition == :stormy
  end

end