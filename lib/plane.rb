class Plane

  def land(airport)
    fail "Plane is already landed at #{airport}." if airport.planes.include? (self)
    airport.store_plane(self)
  end

  def take_off(airport)
    airport.release_plane(self)
  end

  def confirm_landed?
    true
  end

  def confirm_take_off?
    true
  end

end
