class Weather

  def weather_forecast
    if random_number < 7
      "Sunny"
    else
      "Stormy"
    end
  end 

private

  def random_number
    rand(1..10)
  end
end
