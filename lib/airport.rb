require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if full?
    plane.landed
    @planes << plane
  end

  def take_off
    @planes.last.flying
    @planes.pop
  end

  attr_reader :planes, :capacity

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
