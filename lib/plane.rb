class Plane
  attr_reader :landed_at

  def land_at(airport)
    arrive_to(airport) if airport.landing_clear?
  end

  def landed?(airport)
    @landed_at == airport
  end

  def takeoff_from(airport)
    depart_from(airport) if airport.takeoff_clear?
  end

  private

  def depart_from(airport)
    fail "Can\'t depart from #{airport}, I\'m not there." unless landed?(airport)
    @landed_at = nil
    airport.plane_left
  end

  def arrive_to(airport)
    @landed_at = airport
    airport.plane_arrived
  end
end
