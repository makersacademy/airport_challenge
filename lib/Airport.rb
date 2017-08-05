
class Airport

  def initialize

  end

  def land(plane, airborne = true)
    raise "Plane not in the air" unless airborne
    plane
  end

end
