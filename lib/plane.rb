class Plane
  def land(airport)
    raise "already landed" if status(airport) == true
    raise "airport full" if airport.full? == true
    raise "It is stormy" if airport.stormy? == true
    airport.planes << self
  end

  def take_off(airport)
    raise "No such a plane on this airport" if status(airport) == false
    raise "It is stormy" if airport.stormy? == true
    airport.planes.delete(self)
  end

  def status(airport)
    airport.planes.include?(self)
  end
end
