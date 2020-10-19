require 'plane'

class Airport

  attr_writer :capacity

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def capacity
    @capacity == 10
  end

  def total_planes
    @total_planes ||= []
# not sure why this works?
  end

  def receive(plane)
    raise 'Full' if full?

    @total_planes << plane
  end

  def takeoff(plane)
    total_planes.delete(plane)
  end

  def full?
    total_planes.length >= @capacity
  end

  def plane_count
    total_planes.count
  end
end
