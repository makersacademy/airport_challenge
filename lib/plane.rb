class Plane

  attr_reader :airborne

  def initialize
    @airborne = true
  end

  def landed
    @airborne = false
  end

  def airborne?
    @airborne
  end

end
