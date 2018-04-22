class Weather
  attr_reader :wind_speed, :rand

  STORMY_WIND_SPEED = 36
  MAX_WIND_SPEED = 40

  def rand
    @rand = Random.rand(61)
  end

  def randomized_wind
    @rand.rand_between(0, MAX_WIND_SPEED)
  end

  def initialize(wind_speed = randomized_wind)
    @wind_speed = wind_speed
  end

  def stormy?
    wind_speed >= STORMY_WIND_SPEED
  end
end
