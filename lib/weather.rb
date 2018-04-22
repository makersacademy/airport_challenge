require_relative './randomiser'

class Weather
  attr_reader :wind_speed

  STORMY_WIND_SPEED = 36
  MAX_WIND_SPEED = 61

  def randomized_wind
    Randomizer.random_range(0, MAX_WIND_SPEED)
  end

  def initialize(wind_speed = randomized_wind)
    @wind_speed = wind_speed
  end

  def stormy?
    wind_speed >= STORMY_WIND_SPEED
  end
end
