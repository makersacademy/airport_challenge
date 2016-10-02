require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def cleared_landing(plane)
    @planes << plane
  end

  def cleared_takeoff(plane)
    @planes.delete(plane)
  end
end
