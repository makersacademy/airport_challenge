class Plane
  def land(airport)
    raise "already landed" if status(airport)
    raise "airport full" if airport.full?
    raise "It is stormy" if airport.stormy?
    airport.planes << self
  end

  def take_off(airport)
    raise "No such a plane at this airport" if status(airport) == false
    raise "It is stormy" if airport.stormy?
    airport.planes.delete(self)
  end

  def status(airport)
    airport.planes.include?(self)
  end
end
