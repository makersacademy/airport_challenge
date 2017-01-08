require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    plane.airborne = false
    "#{plane} has landed"
  end

  def take_off(plane)
    fail 'No planes available' if @planes.empty?
    plane.airborne = true
    "#{@planes.pop} has taken off"
  end

end
