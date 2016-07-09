class Plane

attr_accessor :status

  def take_off(airport)
    fail 'stormy weather cannot take off' if airport.weather == 'stormy'
    airport.planes.delete(self)
    @status = 'plane has taken off'
  end

  def land(airport)
    fail 'stormy weather cannot land' if airport.weather == 'stormy'
    airport.planes << self
    @status = 'plane has landed'
  end

end
