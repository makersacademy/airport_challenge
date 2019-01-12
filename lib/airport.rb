require_relative 'plane'

class Airport

  attr_accessor = :runway

  def initialize
    @runway = []
  end

  def land(plane)
    @runway.push(plane)
  end

  def takeoff(plane)
     plane
  end

end
