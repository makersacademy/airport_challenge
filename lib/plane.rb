class Plane
  
  def initialize
    @airborne = true
  end

  def touch_down
    @airborne = false
  end

  def lift_off
    @airborne = true
  end

  def flying?
    @airborne
  end
end
