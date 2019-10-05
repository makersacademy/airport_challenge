class Weather
  STORM_CONSTANT = 3
  def stormy?
    random_weather <= STORM_CONSTANT
  end

  private
  # random weather forecast out of 10 (3 and below is stormy)
  def random_weather
    @weather = rand(10)
  end
end