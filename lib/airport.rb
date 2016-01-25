require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 200
  attr_reader :landed_planes, :capacity

  def initialize (capacity=DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Runway is full, unable to land' if full?
    fail 'Cannot land due to stormy weather' if stormy
    landed_planes << plane
  end

  def take_off(plane)
    fail 'Cannot take off due to stormy weather' if stormy
    landed_planes.delete plane
  end

  private

  def stormy
    rand(10) < 3
  end

  def full?
    landed_planes.size >= capacity
  end

end
