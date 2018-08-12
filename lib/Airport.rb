require_relative "Plane"
class Airport
  attr_reader :hangar 

  def initialize
    @hangar = []
  end
    
  def land(plane) 
    @hangar << plane
    "#{plane} has landed"
  end
    
  def take_off(plane)
         
    # fail "Unable to take off due to storm" if stormy?
    return "This plane is not in the hangar" unless @hangar.include?(plane)
    plane_index = @hangar.index(plane)
    @hangar.delete_at(plane_index)
    "#{plane} has taken off"
  end
end
