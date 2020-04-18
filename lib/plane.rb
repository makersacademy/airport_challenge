class Plane

  def land_at_airport(airport)
    airport.planes << self unless check_conditions(airport)
  end

  def leave_airport(airport)
    airport.planes.delete(self) unless airport.weather.stormy?
  end

  private
  def check_conditions(airport)
    airport.weather.stormy? || airport.full?
  end
end
