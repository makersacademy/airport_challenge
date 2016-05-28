
class Plane
  def take_off_from(airport)
    airport.release(self)
    @flying = true
  end

  def land_at(airport)
    airport.dock(self)
    @flying = false
  end

  def flying?
    @flying
  end
end
