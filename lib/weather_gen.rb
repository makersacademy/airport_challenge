class WeatherGenerator

  # returns true if random number (0 to 7 inclusive) is > 5 e.g. 25% chance of being stormy (I don't like those odds!)
  def forecast_stormy?
    rand(0..7) > 5
  end
end