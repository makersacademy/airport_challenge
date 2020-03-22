require './lib/plane'

class Airport
  def initialize
    @planes =[]
  end

  def plane_landing(plane)
    @planes.push(plane)
  end

  def look_at_planes
    @planes
  end

end
