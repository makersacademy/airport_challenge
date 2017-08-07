class Plane

  attr_reader :landed

  def land(airport)
    fail 'already landed' if landed
    fail 'airport did not tell plane to land' unless airport.here? self
    # second fail prevents plane.land method being called by a non/wrong airport
    @landed = true
  end

  def take_off(airport)
    fail 'already taken off' unless landed
    fail 'plane must take off from airport it is in' unless airport.here? self
    # second fail ensures
    @landed = false
    notify(airport)
    # notify method removes plane from airport's planes array and is included
    # for cases where the plane is landed at an airport
    # and the plane.take_off method is called, but not by the airport.
  end

  def notify(airport)
    airport.remove_from_roster self
  end
end
