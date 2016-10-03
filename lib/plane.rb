class Plane

  def initialize
    @landed = false
  end
  
  def landed?
    @landed
  end
  
  def land_status
    @landed = true
  end
  
  def departure_status
    @landed = false
  end
  
end