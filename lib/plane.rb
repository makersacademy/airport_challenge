class Plane 
  def initialize(flying = true)
    @flying = flying
  end

  def land
    @flying = false
  end

  def takeoff
    @flying = true
  end

  def flying?
    @flying
  end
end
