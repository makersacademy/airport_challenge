class Plane

  def land_at(airport)
    @airport = airport
    @flying = false
  end

  def depart_from(airport)
    fail "Wrong airport" if airport != @airport
    @flying = true
  end

  def flying?
    @flying
  end

end
