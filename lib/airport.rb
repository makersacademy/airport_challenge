require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Stormy weather preventing landing" if stormy?
    @planes << plane
    plane.airborne = false
    "#{plane} has landed"
  end

  def take_off(plane)
    fail 'Stormy weather preventing take off' if stormy?
    fail 'No planes available' if @planes.empty?
    plane.airborne = true
    "#{@planes.pop} has taken off"
  end

  def stormy?
    rand > 0.5? true : false
  end

end
