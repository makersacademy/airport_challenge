require 'plane'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    @planes.pop
  end

end
