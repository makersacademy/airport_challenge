class Plane
  attr_reader :landed_at

  def land_at(airport)
    raise "Error. Can\'t land what\'s already landed." unless in_flight?
    airport.land self
    checkin_to airport
  end

  def landed_at?(airport)
    @landed_at == airport
  end

  def takeoff_from(airport)
    raise "Error. Can\'t take-off from #{airport} as we are not there." unless landed_at?(airport)
    airport.takeoff self
    checkout
  end

  private

  def in_flight?
    @landed_at ? false : true
  end

  def checkout
    @landed_at = nil
  end

  def checkin_to(airport)
    @landed_at = airport
  end
end
