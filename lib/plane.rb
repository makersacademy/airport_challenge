class Plane
  
  def initialize
    @flying = true
    @landed = false
  end
  
  def flying?
    @flying
  end
  
  def land
    @flying = false
    @landed = true
  end
  
  def landed?
    @landed
  end
  
  def take_off
    @flying = true
    @landed = false
  end
  
end
