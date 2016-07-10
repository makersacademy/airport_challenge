require_relative 'weatherstate'

class Plane

attr_accessor :status

  def take_off(airport)
    fail 'plane already taken off' if self.status == 'taken off'
    fail 'stormy weather cannot take off' if airport.weather == 'stormy'
    airport.planes.delete(self)
    self.status = 'taken off'
  end

  def land(airport)
    fail 'plane already landed' if self.status == 'landed'
    fail 'stormy weather cannot land' if airport.weather == 'stormy'
    fail 'airport is full cannot land' if airport.full?
    airport.planes << self
    self.status = 'landed'
  end

end
