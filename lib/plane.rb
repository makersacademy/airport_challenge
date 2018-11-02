
class Plane

  def land(airport)
    airport.planes << self
  end

  def take_off(airport)
    airport.planes.each do |plane|
      if plane == self
        airport.planes.delete(self)
      end
    end
  end

  def in_airport?
  end

end
