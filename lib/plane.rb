require_relative "airport"

class Plane
  def initialize
    @airport = nil
  end

  def land(airport)
    fail "Airport is full" if airport.full?
    @airport = airport
    @airport.plane_landed
  end

  def takeoff
    @airport = nil
  end

  def in_airport?(airport)
    @airport == airport
  end
end
