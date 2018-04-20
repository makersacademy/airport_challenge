require 'randomizer'

class Weather
  attr_reader :wind_speed

  STORMY_WIND_SPEED = 35
  MAX_WIND_SPEED = 40

  def initialize(wind_speed = Randomizer.rand_between(0, MAX_WIND_SPEED))
    @wind_speed = wind_speed
  end

  def stormy?
    wind_speed > STORMY_WIND_SPEED
  end
end
