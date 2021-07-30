class Plane

  def land(airport)
    airport.hangar << self
  end

  def take_off(airport)
    airport.hangar.delete(self)
  end

end
