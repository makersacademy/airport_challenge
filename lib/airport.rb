class Airport

  DEFAULT_CAPACITY = 10
  FULL_CAPACITY_ERROR_MSG = 'Airport at full capacity.'
  STORMY_WEATHER_ERROR_MSG = 'Weather is stormy.'

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @airport_capacity = capacity
    @planes = []
    @weather = weather
  end

  def take_off(plane)
    raise STORMY_WEATHER_ERROR_MSG if stormy?
  end

  def land(plane)
    raise_error_on_landing
    @planes << plane
  end

  private
  
  def raise_error_on_landing
    raise STORMY_WEATHER_ERROR_MSG if stormy?
    raise FULL_CAPACITY_ERROR_MSG if airport_full?
  end

  def airport_full?
    @planes.size == @airport_capacity
  end

  def stormy?
    @weather.stormy?
  end
end
