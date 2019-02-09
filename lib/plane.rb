class Plane
  def land(airport)
    airport.add_plane(self)
  end

  def take_off(airport)
    airport.delete_plane(self)
  end

  def is_in?(airport)
    airport.planes.include?(self)?true:false
  end
end
