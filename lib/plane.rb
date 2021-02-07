class Plane
  attr_reader :location

  def initialize location=:in_flight
    @location = location
  end

  def land(airport)
    fail "Airport is full" if not airport.space?
    fail "Not safe to land" if not airport.safe?
    landing = airport.land(self)
    if landing == true
      @location = airport
    else
      landing
    end
  end

  def takeoff
    fail "Not safe to takeoff" if !@location.safe?
    @location.takeoff(self)
    @location = :in_flight
  end

end