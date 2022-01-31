# require './lib/plane'

class Airport
  airport = Airport.new

  def initialise(capacity = 5)
    @capacity = capacity
  end
  
  def land(plane)
    airport = Airport.new
    plane
  end

  def takeoff(plane)
    "#{plane} has taken off"
  end
end
