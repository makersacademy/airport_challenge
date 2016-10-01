require 'plane.rb'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    self
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def planes
    @planes
  end

end
