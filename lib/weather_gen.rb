class WeatherGenerator

  # returns true if random number (1 to 4 inclusive) == 4 e.g. 25% chance of being stormy
  def forecast_stormy?
    rand(1..4) == 4
  end
end
