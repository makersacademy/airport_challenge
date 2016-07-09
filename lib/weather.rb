class Weather
  CHANCE_OF_STORM = 2 # as n/10 so 2 == 20% chance; 10 == 100% chance

  def initialize
    stormy = storm_generator
  end

  def stormy?
    stormy == true
  end

  private

  attr_reader :stormy

  def storm_generator
    return true if forecast_weather < CHANCE_OF_STORM
    false
  end

  def forecast_weather
    rand(10)
  end

end
