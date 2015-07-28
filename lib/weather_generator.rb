module WeatherGenerator
  WEATHER_STATES = ["sunny", "stormy"]

  def weather_state
    num=rand(10)
    num>0? WEATHER_STATES[0] : WEATHER_STATES[1]
  end
end
