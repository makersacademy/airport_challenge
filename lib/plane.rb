class Plane
 
  def initialize
    @flying = true
  end
  
  def flying?
    @flying
  end
  
  def landed?
    raise "Plane has already landed" unless @flying
    @flying = false
  end
  
  def taken_off?
    @flying
  end
  
end