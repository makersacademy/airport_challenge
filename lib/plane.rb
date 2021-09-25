class Plane
  def in_airport?(airport)
    return true if airport.planes.include?(self)
    return false
  end
end