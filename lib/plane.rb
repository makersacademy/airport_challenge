class Plane

  attr_reader :self

  def land(airport)
    airport.land_plane(self)
  end

  def me
    return self
  end


end