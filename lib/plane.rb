class Plane
  attr_reader :landed_at

  def land_at(airport)
    raise "Error. This plane is not in flight, we can\'t land it." unless in_flight?
    airport.land self
    checkin_to airport
  end

  def landed_at?(airport)
    @landed_at == airport
  end

  def takeoff_from(airport)
    raise "Error. We are in midair Can\'t take-off until landed again." unless landed_at?(airport)
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
