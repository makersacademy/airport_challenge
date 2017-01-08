require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    "#{plane} has landed"
  end

  def fly
    fail 'No planes available' if @planes.empty?
    "#{@planes.pop} has taken off"
  end

end
