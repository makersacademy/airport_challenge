class Plane

  def land_at_airport(airport)
    return if check_conditions(airport) || airport.docked?(self)

    airport.planes << self
  end

  def leave_airport(airport)
    return if airport.weather.stormy? || airport.not_docked?(self)

    airport.planes.delete(self)
  end

  private
  def check_conditions(airport)
    airport.weather.stormy? || airport.full?
  end
end
