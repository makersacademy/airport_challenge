class Plane

  def land(airport)
    airport.stored_planes.push(self)
  end

end
