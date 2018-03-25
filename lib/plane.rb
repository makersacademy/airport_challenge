class Plane

  attr_accessor :airborne
  attr_reader :reg

  def initialize(reg)
    @reg = reg
  end

  def takeoff
    @airborne = true
  end

  def touchdown
    @airborne = false
  end

end
