class Plane
  
  attr_reader :port
  
  def initialize
    @state = true
  end
  
  def land_at(airport)
    @state = false
    @port = airport
    airport.dock(self)
  end
  
  def depart
    @state = true
    @port.undock(self)
  end
  
  def flying?
    @state
  end
end