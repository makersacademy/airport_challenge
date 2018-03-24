class Plane
  def land(airport)
    raise "airport full" if airport.full? == true
    raise "already landed" if self.status(airport) == true
    raise "It is stormy" if airport.weather.stormy? == true
    airport.planes << self
  end

  def take_off(airport)
    raise "No such a plane on this airport" if self.status(airport) == false
    raise "It is stormy" if airport.weather.stormy? == true
    airport.planes.delete(self)
  end

  def status(airport)
    airport.planes.include?(self)
  end
end
