class Weather
  def initialize
    @stormy = rng_weather.sample
  end
  def stormy?
    @stormy
  end
  def stormy= stormy
    @stormy = stormy
  end
  def rng_weather
    rng_weather = [true, true, true, false]
  end
end
