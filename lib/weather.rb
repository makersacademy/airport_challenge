class Weather
  CHANCE_OF_STORM = 2 # as n/10 so 2 == 20% chance; 10 == 100% chance

  def stormy?
    storm_generator == true
  end

  private

  def storm_generator
    return true if forecast_good_weather < CHANCE_OF_STORM
    false
  end

  def forecast_good_weather
    rand(10)
  end

end
