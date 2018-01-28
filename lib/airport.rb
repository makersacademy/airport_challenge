require_relative './weather'

class Airport
  extend Weather
  DEFAULT_CAPACITY = 10

  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport at capacity" if at_capacity?
    raise "Too stormy to land" if stormy?
    planes << plane
  end

  def take_off(plane)
    raise "Too stormy to take off" if stormy?
    raise "Plane not in this airport" unless planes.include?(plane)
    planes.reject! { plane }
  end

  private

  attr_reader :capacity

  def stormy?
    Weather::stormy?
  end

  def at_capacity?
    planes.length >= capacity
  end

end
