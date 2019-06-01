class Plane
  def land_at(airport)
    airport.add_plane(self)
    true
  end
end