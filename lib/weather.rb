class Weather

  RANDOM_WEATHER = 20
  CHANCE_OF_STORMY = 1

  def fine_weather?
    # will return false if weather is stormy - 5% chance
    rand(RANDOM_WEATHER) != CHANCE_OF_STORMY
  end 

end

