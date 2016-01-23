
require_relative "plane"

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    planes << plane
    "#{plane} has landed"
  end

  def takeoff plane
    planes.delete(plane)
    "#{plane} has taken off"
  end

end