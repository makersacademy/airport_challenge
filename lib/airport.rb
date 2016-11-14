require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :planes, :total_capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY )
    @planes = []
    @total_capacity = capacity
  end

  def instruct_to_land(plane)
    raise("Too stormy to land") if Weather.new.stormy?
    return "Airport full" if full?
    return "Plane has already landed" if landed?(plane)
    plane.land
    @planes << plane
  end

  def landed?(plane)
    @planes.include?(plane)
  end

  def instruct_to_take_off(plane)
    raise("Too stormy to take off") if Weather.new.stormy?
    return "Plane has already taken off" if !landed?(plane)
    @planes.delete(plane)
  end

  def full?
    @planes.length >= @total_capacity
  end

end
