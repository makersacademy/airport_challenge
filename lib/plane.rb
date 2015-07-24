class Plane
  
  def initialize
    @flying = true
  end
  
  def flying?
    @flying
  end
  
  def land
  end
  
  def landed
    !@flying
  end
  
  def take_off
    @flying
  end
  
end
