class Plane
  attr_reader :status
  
  def initialize
    @status = :landed
  end
  
  def land(airport)
    return "Plane #{self} is already landed" unless @status == :flying
    raise "Cannot land" unless airport.ready_for_landing?
    @status = :landed
    airport.receive_plane(self)
    "Plane #{self} has landed at #{airport.name}"
  end
  
  def take_off(airport)
    msg = "The plane is at another airport. Cannot take off from this location!"
    return "Plane #{self} is already flying" unless @status == :landed
    raise msg unless airport.planes.include? self
    raise "Cannot take off" unless airport.ready_for_taking_off?
    @status = :flying
    airport.release_plane(self)
    "Plane #{self} has taking off from #{airport.name}"
  end
end