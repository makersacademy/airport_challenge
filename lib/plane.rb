class Plane
#understands when planes are in flight or landed
attr_reader :airborne

  def initialize
    @airborne = true
  end

  def landed
    @airborne = false
  end

  def flying
    @airborne = true
  end

end
