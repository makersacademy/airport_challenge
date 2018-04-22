class Weather
  attr_reader :wind_speed

  def initialize
    @wind_speed = Randomizer.rand_between(0, 61)
  end
  def initialize(wind_speed = Randomizer.rand_between(0, 61))
    @wind_speed = wind_speed
    end

  def stormy?
    wind_speed >= STORMY_WIND_SPEED
  end
