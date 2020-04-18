class Plane
  def land_at_airport(airport)
    airport.planes << self unless airport.is_full?
  end

  def leave_airport(airport)
    airport.planes.delete(self)
  end
end
