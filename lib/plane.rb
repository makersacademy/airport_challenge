class Plane
  
  attr_accessor :in_flight 
  
  def initialize
    @in_flight = false
  end 
  
  def take_off
    fail "Cannot take off - already in flight" unless @in_flight == false
    @in_flight = true
    "Confirming departure"
  end

  def land
    fail "Cannot land - not in flight" unless @in_flight == true
    @in_flight = false
  end
end

