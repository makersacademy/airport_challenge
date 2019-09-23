class Weather

  def weather_condition
  random_number = rand(10)
    if random_number < 2
      return "stormy"
    else
      return "sunny"
    end
  end

end
