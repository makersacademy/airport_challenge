class Airport
    attr_reader :capacity
    attr_accessor :plane
 
  def takeoff 
    fail "Too stormy to take-off" if stormy?
    # puts "The flight has taken off"
    true
  end

  def land
    fail "Too stormy to land" if stormy?
  end
  
  def stormy?
    true
  end
end