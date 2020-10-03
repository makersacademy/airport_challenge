class Plane
  def initialize
    @flying = false
  end
  
  def flying
    @flying = true
  end

  def in_air?
    @flying
  end
end
