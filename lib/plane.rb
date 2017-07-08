class Plane
  attr_reader :landed_at

  def land_at(airport)
    fail "Can\'t do that. Already landed at #{@landed_at}." if @landed_at
    fail "Can\'t take off, no clearance from #{airport}." unless airport.landing_clear?
    arrive_to(airport)
  end

  def landed?(airport)
    @landed_at == airport
  end

  def takeoff_from(airport)
    fail "Can\'t depart from #{airport}, I\'m not there." unless landed?(airport)
    fail "Can\'t take off, no clearance from #{airport}." unless airport.takeoff_clear?
    depart_from(airport)
  end

  private

  def depart_from(airport)
    @landed_at = nil
    airport.plane_left(self)
  end

  def arrive_to(airport)
    @landed_at = airport
    airport.plane_arrived(self)
  end
end
