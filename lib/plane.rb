class Plane

  attr_accessor :airborne
  attr_accessor :reg

  def initialize(reg)
    @reg = reg
  end

  def liftoff
    @airborne = true
  end

  def touchdown
    @airborne = false
  end

end
