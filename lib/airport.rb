require 'plane'

class Airport
  DEFAULT_CAPACITY = 30
  attr_reader :capacity
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    raise "Airport full" if full?
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def planes
    @planes
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
end
