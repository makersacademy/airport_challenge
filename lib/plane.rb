class Plane
  attr_reader :landed_at

  def in_flight?
    @landed_at ? false : true
  end

  def land_at(airport)
    airport.land self
    checkin_to airport
  end

  def landed_at?(airport)
    @landed_at == airport
  end

  def takeoff_from(airport)
    airport.takeoff self
    checkout
  end

  private

  def checkout
    @landed_at = nil
  end

  def checkin_to(airport)
    @landed_at = airport
  end
end
