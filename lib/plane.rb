class Plane

# 
  def initialize
    @flying = true
    @landed = false
  end

  def flying?
    @flying
  end

  def landed?
    !@flying
  end

  def landing
    @landed = true
    @flying = false
  end

end
