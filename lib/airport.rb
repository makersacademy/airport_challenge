require_relative 'plane'

class Airport
  attr_reader :capacity
  
  def initialize
    @capacity = 20
  end

  def land(plane)
    raise "This airport is full." if @plane
    @plane = plane
  end

  def take_off(plane)
    plane.flying
    @plane
  end
end
