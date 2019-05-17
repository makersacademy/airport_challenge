class Weather

  def state_of_weather
    random_number = rand(1..6)
    random_number > 5 ? "stormy" : "sunny"
  end
  
end