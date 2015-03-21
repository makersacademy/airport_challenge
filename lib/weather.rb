class Weather
  def weather
    @weather = [:sunny, :stormy]
  end

  def ok
    weather.sample
  end
end
