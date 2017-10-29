class Plane
  def land(airport)
    airport.landed_planes << self
  end

  def take_off(airport)
    fail "There are no planes in the airport to take off" if airport.landed_planes.empty?
    fail "The weather is stormy! No planes can take off at the moment." if airport.stormy?
    airport.landed_planes.pop
  end
end
