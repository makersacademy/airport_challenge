require_relative 'airport'

class Plane

  def land(airport)
    return 'Too stormy to land' if airport.stormy == true
    return 'Airport is full' if airport.full?

    airport.planes << self
  end

  def take_off(airport)
    return 'Too stormy to take off' if airport.stormy == true

    airport.planes.delete(self)
    airport.confirm_departure(self)
  end

  def grounded_in?(airport)
    airport.planes.include?(self)
  end
end
