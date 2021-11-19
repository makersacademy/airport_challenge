class Plane
  def land(airport)
    if airport.full? then fail "airport is full" end
    airport.planes.push(self)
  end

  def depart(airport)
    airport.planes.delete(self)
  end
end