class Weather
  def current
    weather_number = random_number
    if weather_number == 1
      weather = "stormy"
    else 
      weather = "sunny"
    end
    return weather
  end
  
  def random_number
    rand(10)
  end
end
