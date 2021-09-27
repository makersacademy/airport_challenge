class Plane
  
  def initialize(flying = true)
    @flying = flying
  end

  def landed
    @flying = false
  end

  def flying
    @flying = true
  end

end
