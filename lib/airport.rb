require_relative 'plane'

class Airport
    attr_reader :plane, :airport_capacity
  def initialize(capacity = 5)
    @airport_capacity = capacity
    @plane = []
  end

  def land(plane)
    raise 'The airport is full' if full? 
    
    @plane.push(plane)
  end

  def take_off(plane)
    raise 'Cannot take off due to storm' if stormy? == 3
    @plane.delete(plane)
    "#{plane} has taken off"
  end

  def stormy?
    rand(4)
  end

  private

  def full?
    @plane.length  >= @airport_capacity
  end
end