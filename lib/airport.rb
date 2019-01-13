require_relative 'plane'

class Airport

  attr_accessor = :runway

  def initialize
    @runway = []
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
      @runway.count >= 10
  end

end
