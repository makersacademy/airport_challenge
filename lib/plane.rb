class Plane
  attr_reader :airport

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def land(airport)
    raise "Plane not flying" if not flying? 
    @flying = false
    @airport = airport
  end

end
