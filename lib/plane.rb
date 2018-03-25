class Plane

  attr_accessor :airborne

  def initialize
  end

  def takeoff
    @airborne = true
  end

  def touchdown
    @airborne = false
  end

end
