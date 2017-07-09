
class Plane
  def land(airport)
    fail 'The airport has a storm' if airport.storm?
    fail 'The airport is full' if airport.full?
    fail 'The plane has already landed' if airport.planes.include?(self)
    airport.planes.push(self)
  end

  def take_off(airport)
    fail 'The airport has a storm' if airport.storm?
    fail 'The plane is not in this airport' if airport.planes.include?(self) == false
    airport.planes.pop
  end
end
