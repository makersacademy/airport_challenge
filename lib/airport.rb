class Airport
    
  def land(plane)
    fail "Cannot land anymore plane, airport is full." if plane
  end

  def take_off(plane)
    plane
  end

end