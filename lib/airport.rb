require_relative 'plane'

class Airport
  attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    @planes.delete(plane)
  end
end
