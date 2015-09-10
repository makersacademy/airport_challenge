require_relative 'plane'

class Airport

 attr_accessor :planes

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def instruct_takeoff(plane)
    plane.take_off
    @planes.delete(plane)
  end

  def instruct_landing(plane)
    @planes << plane
    plane.flying = false
    plane.current_airport = self
    return nil
  end

end
