class Plane
  def land(airport)
    fail "The weather is stormy! No planes can land at the moment." if airport.stormy?
    fail "The plane can't land as the airport is full." if airport.landed_planes.length >= airport.capacity
    airport.landed_planes << self
    airport.capacity -= 1
  end

  def take_off(airport)
    fail "There are no planes in the airport to take off" if airport.landed_planes.empty?
    fail "The weather is stormy! No planes can take off at the moment." if airport.stormy?
    airport.landed_planes.pop
    airport.capacity += 1
  end
end
