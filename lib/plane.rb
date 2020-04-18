class Plane
  
  attr_reader :port
  
  def initialize
    @state = true
  end
  
  def land_at(airport)
    raise 'This plane is already landed.' if @state == false
    raise 'That airport is full.' if airport.full?
    @state = false
    @port = airport
    airport.dock(self)
  end
  
  def depart
    raise 'Plane is already airborne.' if @state
    @port.undock(self)
    @state = true
    @port = nil
  end
  
  def flying?
    @state
  end
end