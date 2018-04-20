require 'randomizer'

class Weather
  attr_reader :wind_speed

  def initialize(wind_speed = Randomizer.rand_between(0, 40))
    @wind_speed = wind_speed
  end

  def stormy?

  end
end
