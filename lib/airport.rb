require_relative 'plane'

class Airport

  def initialize
    @planes_landed = []
  end

  def land(plane)
    @planes_landed << plane
    return "Plane landed"
  end

  def take_off(plane)
    @planes_landed.pop
    return "Plane taken off"
  end
end
