class Plane
  def land_at(airport)
    airport.add_plane
    true
  end

  def take_off_from(airport)
    true
  end
end