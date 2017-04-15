class Weather

  STORM_RATE = 0.1

  def stormy?
    @stormy
  end

  def generate_weather(rate = STORM_RATE)
    @stormy = Random.rand >= 1.0 - rate
  end
end
