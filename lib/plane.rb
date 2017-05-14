class Plane

  def initialize
    @in_airport = false
  end

  def in_airport?
    @in_airport
  end

  def take_off(airport)
    airport.take_off(self)
    @in_airport = false
  end

  def land(airport)
    airport.land(self)
    @in_airport = true
  end

end
