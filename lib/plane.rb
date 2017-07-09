
class Plane
  def land(airport)
    fail 'The airport is full' if airport.full?
    fail 'The plane has already landed' if airport.planes.include?(self)
    # fail 'The airport has a storm' if Weather.new.storm(airport) == false
    airport.planes.push(self)
  end

  def take_off(airport)
    fail 'The plane is not in this airport' if airport.planes.include?(self) == false
    airport.planes.pop
  end
end
