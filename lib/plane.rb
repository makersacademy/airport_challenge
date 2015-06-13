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
    @landed = true
  end

  def landing
    @flying = false
    @landed = true
  end

end
