class Plane

attr_reader :airborne

  def initialize
    @airborne = false
  end

  def flying
    @airborne = true
  end

  def landed
    @airborne = false
  end

  def airborne?
    @airborne
  end

end
