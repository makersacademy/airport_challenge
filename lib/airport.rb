require_relative 'weather_service'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize(weather_service, capacity = DEFAULT_CAPACITY)
    @weather_service = weather_service
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    plane.land(self)
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off plane: weather is stormy' if stormy?
    raise 'Cannot take off plane: plane not at this airport' unless at_airport?(plane)
    plane.take_off
    @planes.pop
    plane
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather_service.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end
end
