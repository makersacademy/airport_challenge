class Airport
    attr_reader :hangar
  
  def initialize
    @hangar = []
  end 

  def land(plane)
    plane
  end 

  def take_off(plane)
    "Plane is airborne"
  end 

end 