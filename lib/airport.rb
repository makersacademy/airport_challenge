require_relative '../lib/plane'

class Airport

  DEFAULT_CAPACITY = 10
  FULL_CAPACITY_ERR = 'Airport at full capacity.'
  STORMY_WEATHER_ERR = 'Weather is stormy.'
  PLANE_NOT_AT_AIRPORT_ERR = 'Plane not at airport'

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @airport_capacity = capacity
    @planes = []
    @weather = weather
  end

  def take_off(plane)
    raise STORMY_WEATHER_ERR if stormy?
    raise PLANE_NOT_AT_AIRPORT_ERR if @planes.empty?
    @planes.pop.take_off
  end

  def land(plane)
    raise_error_on_landing
    @planes << plane.land
  end

  private

  def raise_error_on_landing
    raise STORMY_WEATHER_ERR if stormy?
    raise FULL_CAPACITY_ERR if airport_full?
  end

  def airport_full?
    @planes.size == @airport_capacity
  end

  def stormy?
    @weather.stormy?
  end
end
