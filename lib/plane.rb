class Plane

  def initialize
    @in_airport = true
  end

  def in_airport?
    @in_airport
  end

  def take_off(airport)
    @in_airport = false
  end

  def land(airport)
    raise "Unable to land - airport full" if airport.full?
    airport.land(self)
    @in_airport = true
  end

end
