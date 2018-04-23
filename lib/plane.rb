class Plane

  def initialize(flying = true)
    @flying = flying
  end

  def landing
    fail "This plane has already landed" unless @flying
    @flying = false
  end

  def flying
    @flying = true
  end
end
