class Plane
  def initialize
    @airborne = true
  end
  def land airport
    if airport.can_land?
      airport.landing(self)
      @airborne = false
    end
  end

  def takeoff airport
    if airport.can_takeoff?
      @airborne = true
    end
  end

  def isAirborne?
    @airborne
  end
end
