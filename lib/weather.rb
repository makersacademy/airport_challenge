class Weather

  PER_CENT_CHANCE = 2 #per cent chance

  def stormy?
    weather_condition = rand(1..100)
    weather_condition < PER_CENT_CHANCE
  end

end
