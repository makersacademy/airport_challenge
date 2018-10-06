class Weather
  POSSIBLE_WEATHER = ["Sunny", "Stormy"]

  def stormy?
    current == "Stormy"
  end

  def current
    POSSIBLE_WEATHER.sample
  end
end
