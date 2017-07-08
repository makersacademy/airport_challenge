class Plane
  attr_reader :landed_at

  def land_at(airport)
    fail "Can\'t do that. Already landed at #{@landed_at}." if @landed_at
    fail "Can\'t take off, no clearance from #{airport}." unless airport.landing_clear?
    checkin_to(airport)
  end

  def landed_at?(airport)
    @landed_at == airport
  end

  def takeoff_from(airport)
    fail "Can\'t depart from #{airport}, I\'m not there." unless landed_at?(airport)
    fail "Can\'t take off, no clearance from #{airport}." unless airport.takeoff_clear?
    checkout_from(airport)
  end

  private

  def checkout_from(airport)
    @landed_at = nil
    airport.checkout(self)
  end

  def checkin_to(airport)
    @landed_at = airport
    airport.checkin(self)
  end
end
