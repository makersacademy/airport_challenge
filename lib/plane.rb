class Plane

  attr_reader :flying

  def initialize(airport=Airport.new, flying=false)
    @airport = airport
    @flying = flying
  end

  def land_at(airport)
    fail "Plane already landed" if flying == false
    @airport = airport
    @flying = false
  end

  def depart_from(airport)
    fail "Wrong airport" if airport != @airport
    fail "Plane already flying" if flying
    @flying = true
  end

end
