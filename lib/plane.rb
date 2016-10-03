class Plane

  def initialize(flying: true)
    @flying = flying
  end

  def airborne?
    @flying
  end

  def flying
    @flying = true
  end

  def landed
    @flying = false
  end
end
