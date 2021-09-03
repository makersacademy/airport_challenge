class Plane

  DEFAULT_FLYING = true

  def initialize(flying = DEFAULT_FLYING)
    @flying = flying
  end

  def flying?
    @flying
  end

  def landing
    @flying = false
  end

  def takeoff
    @flying = true
  end
end
