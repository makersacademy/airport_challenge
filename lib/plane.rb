class Plane
  
  def initialize
    @state = false
  end
  
  def land_at(airport)
    @state = false
  end
  
  def depart_from(airport)
    @state = true
  end
  
  def flying?
    @state
  end
end