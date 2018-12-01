class Weather

  def random_number
    rand(1..2)
  end

  def weather_forecast(random_number)
    random_number == 1 ? 'sunny' : 'stormy'
  end

end
