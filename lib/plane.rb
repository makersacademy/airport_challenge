class Plane

  attr_reader :airborne

  def initialize
    @airborne = true
  end

  def in_air?
    @airborne
  end

  def on_ground?
    @airborne = false
  end

  def lift_off
    @airborne = true
  end

end