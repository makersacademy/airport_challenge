require_relative 'plane'

class Airport

  attr_accessor = :runway

  def initialize
    @runway = []
  end

  def land(plane)
    fail 'Already landed' if @runway.include?(plane)
    @runway.push(plane)
  end

  def takeoff(plane)
     @runway.delete(plane)
     @runway
  end

end
