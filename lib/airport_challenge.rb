class Plane

  def initialize
    @planes = []
  end

  def land(plane = Plane.new)
    @planes << plane
  end

  def take_off
    @planes.pop
    return "Plane has left the airport"
  end

end
