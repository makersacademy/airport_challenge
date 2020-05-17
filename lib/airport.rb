require_relative 'plane'
require_relative 'weather_service'

class Airport

  def initialize(capacity, weather_service)
    @capacity = capacity
    @weather_service = weather_service
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off plane: weather is stormy' if stormy?
  end

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather_service.stormy?
  end
end
