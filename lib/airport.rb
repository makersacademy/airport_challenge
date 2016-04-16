require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 1

  attr_reader :planes, :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    raise "Airport full" if full?
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    raise "Airport empty" if empty?
    plane.departed
    @planes.delete(plane)
  end

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end

end
