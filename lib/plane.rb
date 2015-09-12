class Plane

  attr_accessor :airborne

  def initialize
    @airborne = true
  end

  def airborne?
    @airborne
  end

  def land!
    @airborne = false
  end

  def take_off!
    @airborne = true
  end

end
