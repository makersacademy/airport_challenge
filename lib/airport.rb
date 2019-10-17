class Airport

  def initialize
    @landed = []
  end

  def take_off
    @landed.pop
    return "This plane has left the airport"
  end

  def land(planes)
    @landed << planes
  end

end

class Plane
  def plane
    @plane = Plane.new
  end
end
