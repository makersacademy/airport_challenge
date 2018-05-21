class Plane

  def initialize
    @flying = true
  end
  
  def take_off
    fail "Plane already flying" if @flying
  end

  def land(airport)
    fail "Plane already landed" unless @flying
    @flying = false
    @airport = airport
  end

  def airport
    fail "Plane already flying" if @flying
  end
end
