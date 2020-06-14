class Plane
  attr_reader :airborne
  
  def initialize
    @airborne = true
  end

  def land(airport)
    return fail "Plane is already landed" if @airborne == false
    @airport = airport
    @airport.dock(self)
    @airborne = false
  end

  def takeoff
    return fail "Plane is already airborne" if @airborne == true
    @airport.docking_bay.delete(self)
    @airborne = true
  end

end