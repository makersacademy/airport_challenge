
class Plane
  def take_off_from(airport, weather)
    @flying = true
    airport.release(self)
  end

  def land_at(airport, weather)
    @flying = false
    airport.dock(self)
  end

  def flying?
    @flying
  end
end
