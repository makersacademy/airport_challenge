
class Plane
  def take_off_from(airport, weather)
    @flying = true
    airport.release(self, weather)
  end

  def land_at(airport, weather)
    @flying = false
    airport.dock(self, weather)
  end

  def flying?
    @flying
  end
end
