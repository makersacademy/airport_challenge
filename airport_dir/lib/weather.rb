module Weather

  def good_weather
    weather_val = rand(10)
    if weather_val > 5
      return true
    else
      return false
    end
  end

end
