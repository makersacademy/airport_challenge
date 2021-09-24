require './lib/plane'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if full?
    @planes << plane
  end

  def takeoff
    planes.pop
  end

  private

  def full?
    return true if planes.length >= DEFAULT_CAPACITY
    false
  end
end

