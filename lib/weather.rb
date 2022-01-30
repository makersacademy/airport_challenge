class Weather
  def stormy?
    good = false
    stormy = true
    possible_weather = [good, good, good, stormy]
    possible_weather.sample
  end
end
