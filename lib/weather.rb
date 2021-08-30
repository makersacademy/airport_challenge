class Weather

  def weather_forecast
    weather = ['Stormy', 'Sunny', 'Cloud', 'Rain', 'Overcast']
    weather[rand(4)]
  end

  def weather_conditions
    fail "Weather is unsafe for take off and landings" if weather_forecast == 'Stormy'
  end

end