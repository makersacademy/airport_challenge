class Plane

  attr_reader :airborne

  def initalize
    @airborne = false
  end

  def land
  end

  def take_off
    @airborne = true
  end

end