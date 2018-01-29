class Plane

  attr_reader :airborne

  def initialize(airborne = true)
    @airborne = airborne
  end

  def landed
    @airborne = false
  end

  def taken_off
    @airborne = true
  end

  def airborne?
    @airborne
  end

end
