require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    plane.lift_off
    @planes.delete(plane)
  end



end
