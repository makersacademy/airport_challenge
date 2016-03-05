class Plane

  def land_at(airport)
    @airport = airport
  end

  def depart_from(airport)
    fail "Wrong airport" if airport != @airport
  end


end
