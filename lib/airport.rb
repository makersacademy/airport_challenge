# require './lib/plane'

class Airport
  airport = Airport.new

  def land(plane)
    airport = Airport.new
    plane
  end

  def takeoff(plane)
    "#{plane} has taken off"
  end
end
