class Plane
  def land(airport)
    if airport.full?
      fail "airport is full" 
    elsif airport.is_stormy?
      fail "weather is stormy"
    end
    airport.planes.push(self)
  end

  def depart(airport)
    if airport.is_stormy?
      fail "weather is stormy"
    end
    airport.planes.delete(self)
  end
end