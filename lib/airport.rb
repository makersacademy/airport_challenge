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

end
