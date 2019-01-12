class Weather

  def stormy?
    todays_weather == :stormy
  end

  private

  def weather_possibilities
    [:sunny, :sunny, :sunny, :sunny, :stormy]
  end

  def todays_weather
    weather_possibilities[rand(0..4)]
  end
end
