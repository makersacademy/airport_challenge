class Plane

  attr_reader :airport

  def initialize
    @flying = true
    @airport = nil
  end

  def take_off
    fail "Plane already flying" if @flying
  end

  def land(airport)
    fail "Plane already landed" unless @flying
    @flying = false
    @airport = airport
  end
  
end
