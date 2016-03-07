class Plane

  attr_reader :flying, :airport

  def initialize(airport=Airport.new, flying=false)
    @airport = airport
    @flying = flying
    @airport.planes << self
  end

  def land_at(airport)
    fail "Plane already landed" if flying == false
    @airport = airport
    landed
  end

  def depart_from(airport)
    fail "Wrong airport" if airport != @airport
    fail "Plane already flying" if flying
    fly
  end

  private
  
  def landed
    @flying = false
  end

  def fly
    @flying = true
  end

end
