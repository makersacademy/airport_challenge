class Airport

  DEFAULT_CAPACITY = 10
  FULL_CAPACITY_ERROR = 'Airport at full capacity.'
  STORMY_WEATHER_ERROR = 'Weather is stormy.'
  PLANE_NOT_AT_AIRPORT_ERROR = 'Plane not at airport'

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @airport_capacity = capacity
    @planes = []
    @weather = weather
  end

  def take_off(plane)
    raise STORMY_WEATHER_ERROR if stormy?
    raise PLANE_NOT_AT_AIRPORT_ERROR if @planes.empty?
    @planes.pop
  end

  def land(plane)
    raise_error_on_landing
    @planes << plane
  end

  private

  def raise_error_on_landing
    raise STORMY_WEATHER_ERROR if stormy?
    raise FULL_CAPACITY_ERROR if airport_full?
  end

  def airport_full?
    @planes.size == @airport_capacity
  end

  def stormy?
    @weather.stormy?
  end
end
