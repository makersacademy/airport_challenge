class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def state= (state)
    @flying = state
  end
end
