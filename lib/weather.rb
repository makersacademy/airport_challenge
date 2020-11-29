class Weather
  def makeweather
    weather = ["sunny", "stormy"]
    @condition = weather.sample
  end

  def stormy?
    makeweather
    @condition == "stormy"
  end
end
