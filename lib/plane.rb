class Plane
  def land airport
    if airport.can_land?
      airport.landing(self)
    end
  end

  def takeoff airport
    airport.can_takeoff?
  end
end
