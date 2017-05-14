class Plane

  def initialize
    @in_airport = false
  end

  def in_airport?
    @in_airport
  end

  def take_off(airport)
    airport.try_allow_take_off(self)
    @in_airport = false
  end

  def land(airport)
    raise "Plane is already in an airport" if in_airport?
    airport.try_allow_land(self)
    @in_airport = true
  end

end
