class Plane

  def initialize
    @flying = false
    # Not in flight by default.
  end

  def flying?
    @flying
  end

  def in_air
    @flying = true
  end

end
