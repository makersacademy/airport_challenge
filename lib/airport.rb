require_relative 'plane'

class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
  end

  def landing(plane)
    fail 'Airport is full' if @planes.count >= DEFAULT_CAPACITY
    @planes << plane

  end

  def take_off(plane)
    @planes.pop
    "Plane has taken off"
  end

end