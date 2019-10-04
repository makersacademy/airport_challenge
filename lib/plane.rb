class Plane
  def initialize
    @flying = nil
  end
  def flying?
    @flying
  end
  def inAir
    @flying = true
  end
  def onGround
    @flying = false
  end
end
