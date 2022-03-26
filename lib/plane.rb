class Plane

  def land(airport)
    airport.store_plane(self)
  end

  def take_off(airport)
    airport.remove_plane_from_hangar(self)
    "Plane takes off"
  end

end
