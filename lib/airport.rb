require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor = :runway
  attr_accessor = :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @runway = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Reached Maximum Capacity' if full?
    fail 'Already landed' if @runway.include?(plane)
    @runway.push(plane)
  end

  def takeoff(plane)
     @runway.delete(plane)
     @runway
  end

  def full?
      @runway.count >= DEFAULT_CAPACITY
  end

end
