class Plane

  attr_reader :airborne

  def initialize
    @airborne = true
  end

  def land
    fail "Plane is not airborne" unless @airborne
    @airborne = false
  end

  def takeoff
    fail "Plane is airborne" if @airborne
    @airborne = true
  end

  def airborne?
    @airborne
  end

end
