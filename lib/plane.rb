class Plane 
  def land(airport)
    airport.add_plane(self)
  end

  def takeoff(airport)
    airport.remove_plane(self)
  end
end  