class Airport
    attr_reader :hangar, :capacity

  CAPACITY = 10
  
  def initialize
    @hangar = []
    @capacity = CAPACITY
  end 

  def land(plane)
    plane
  end 

  def take_off(plane)
    "Plane is airborne"
  end 

end 