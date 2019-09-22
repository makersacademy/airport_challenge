class Plane

  def initialize
    @airborne = true
  end

  def takes_off
    @airborne = true
  end

  def lands
    @airborne = false
  end

  def airborne?
    @airborne
  end

end
