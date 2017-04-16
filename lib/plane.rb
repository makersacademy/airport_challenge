class Plane
  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def arrival
    @flying = false
  end

  def departure
    @flying = true
  end
end
