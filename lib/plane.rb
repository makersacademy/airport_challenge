class Plane
  
  attr_reader :port
  
  def initialize
    @state = true
  end
  
  def land_at(airport)
    @state = false
    airport.dock(self)
  end
  
  def depart_from(airport)
    @state = true
  end
  
  def flying?
    @state
  end
end