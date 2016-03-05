class Plane

  attr_reader :flying

  def land_at(airport)
    @airport = airport
    @flying = false
  end

  def depart_from(airport)
    fail "Wrong airport" if airport != @airport
    fail "Plane already flying" if @flying 
    @flying = true
  end

end
