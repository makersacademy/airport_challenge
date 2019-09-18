class Weather

  def stormy?
    #generating a random weather
    weather_array = []
    5.times {weather_array.push("sun")}
    2.times {weather_array.push("storm")}
    if weather_array.sample == "storm"
      return true
    else
      return false
    end
  end
end
