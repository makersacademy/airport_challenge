require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    plane.landed?
  end

  def take_off(plane)
    @planes.pop
    plane.flying?
  end

  def planes
    @planes
  end

end
