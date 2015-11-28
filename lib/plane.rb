require_relative 'airport'

class Plane

  def land_at(airport)
    airport.planes << self
    "Plane #{self.object_id} landed!"
  end

  def take_off_from(airport)
    airport.planes.delete(self)
    "Plane #{self.object_id} just took off!"
  end

end
