require_relative 'plane'
require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 100

  attr_reader :capacity, :planes, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    raise 'Cannot land since airport is full' if full?
    raise 'Unable to land due to stormy weather' if weather.stormy?
    planes << plane
    plane.land
    self
  end

  def take_off(plane)
    raise 'Unable to take off due to stormy weather' if weather.stormy?
    raise 'Plane not in the airport' unless planes.include?(plane)
    planes.delete(plane)
    plane.take_off
    self
  end

  def full?
    @planes == capacity
  end
end
