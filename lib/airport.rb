require 'plane'

class Airport
  def initialize
    @landed_planes = []
  end

  def land
    @landed_planes << Plane.new
    Plane.new
  end

  def take_off
    @landed_planes.pop
    Plane.new
  end
end
