
class Plane
  def take_off_from(airport)
    airport.release(self)
    @flying = true
  end

  def land_at(airport)
    @flying = false
    airport.dock(self)
  end

  def flying?
    @flying
  end
end
