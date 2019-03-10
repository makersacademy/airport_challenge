class Weather
  def weather_check
    if rand(100) < 20
      return "Stormy"
    else
      return "Sunny"
    end
  end
end
