class Plane

  attr_reader :airborne

  def initialize
    @airborne = false
  end

  def takeoff(airport)
    @airborne = true
  end

  def land(airport)
    @airborne = false
  end

end
