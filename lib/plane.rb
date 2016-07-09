class Plane

attr_accessor :status

  def take_off(airport)
    fail 'stormy weather cannot take off' if airport.weather == 'stormy'
    airport.planes.delete(self)
    @status = 'taken off'
  end

  def land(airport)
    fail 'stormy weather cannot land' if airport.weather == 'stormy'
    fail 'airport is full cannot land' if airport.full?
    airport.planes << self
    @status = 'landed'
  end

end
