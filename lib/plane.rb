class Plane
  def initialize
    @airborne = true
  end
  def land airport
    if !self.isAirborne?
      raise 'Plane has already landed'
    end
    if airport.can_land?
      airport.landing(self)
      @airborne = false
    end
  end

  def takeoff airport
    if self.isAirborne?
      raise 'Plane is already airborne'
    end
    if airport.can_takeoff?
      airport.takingoff(self)
      @airborne = true
    end
  end

  def isAirborne?
    @airborne
  end
end
