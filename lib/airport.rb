class Airport
  attr_reader :plane
  def land(plane)
    @plane = plane
    puts plane
  end
  
  def take_off(plane)
    puts plane
    puts @plane
    fail "the plane is not in airport" if plane != @plane
    
    @plane = nil
  end
end
