class Weather

  def weather_generator
    weather = ["sunny", "mild", "warm", "light rain",
    "heavy rain", "overcast", "mild", "stormy",
      "cold and dry", "light snow", "mild"].sample
  end

  def stormy_weather?
    if weather == "stormy"
      true
    else
      false
    end
  end

end
