require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end
end
