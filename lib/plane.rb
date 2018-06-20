class Plane
  def land airport
    airport.can_land
  end

  def takeoff airport
    airport.can_takeoff
  end
end
