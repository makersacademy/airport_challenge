class Plane
  def land(airport)
    airport.landed_planes << self
  end

  def take_off(airport)
    fail "There are no planes in the airport to take off" if airport.landed_planes.empty?
    airport.landed_planes.pop
  end
end
