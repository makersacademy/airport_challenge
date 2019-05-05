class Weather
  def weather
    weather = [:sunny, :sunny, :sunny, :sunny, :stormy]
    weather.sample
  end

  def stormy?
    weather == :stormy
  end
end
