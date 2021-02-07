class Plane
  attr_reader :location

  def initialize location = :in_flight
    @location = location
  end

  def land(airport)
    fail "Already in an airport" unless @location == :in_flight
    fail "Airport is full" unless airport.space?
    fail "Not safe to land" unless airport.safe?

    airport.land(self)
    @location = airport
  end

  def takeoff
    fail "Not safe to takeoff" unless @location.safe?
    
    @location.takeoff(self)
    @location = :in_flight
  end

end
