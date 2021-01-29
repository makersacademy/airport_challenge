require_relative 'plane'

class Airport
    attr_reader :plane
  def initialize(capacity = 5)
    @airport_capacity = capacity
    @plane = []
  end

  def land(plane)
    raise 'The airport is full' if @plane.length  >= @airport_capacity 
    @plane.push(plane)
  end

  def take_off(plane)
    @plane.delete(plane)
    "#{plane} has taken off"
  end

end